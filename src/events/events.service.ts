import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Sequelize } from 'sequelize-typescript';
import { CreateEventInput } from './dto/create-event.input';
import { CreateUsersEventsInput } from './dto/create-users-events.input';
import { UpdateEventInput } from './dto/update-event.input';
import { EventsModel } from './model/events.model';
import { UsersEventsModel } from './model/users-events.model';
import { EventSubTypesModel } from 'src/event-sub-types/model/event-sub-types.model';
import Stripe from 'stripe';
import { ConfigService } from '@nestjs/config';
import Razorpay = require('razorpay');
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { EventsHashTagsModel } from './model/events-hash-tags.model';
import { CreateEventHashTagInput } from './dto/create-event-hash-tag.input';
import { HashTagModel } from 'src/hash-tag/model/hash-tag.model';

@Injectable()
export class EventsService {
  private stripe: Stripe;
  private razorpay: any;

  constructor(
    @InjectModel(EventsModel) private eventsModel: typeof EventsModel,
    private sequelize: Sequelize,
    @InjectModel(UsersEventsModel)
    private usersEventsModel: typeof UsersEventsModel,
    @InjectModel(EventSubTypesModel)
    private eventSubTypesModel: typeof EventSubTypesModel,
    private readonly configService: ConfigService,
    @InjectModel(DataStatusModel)
    private dataStatusModel: typeof DataStatusModel,
    @InjectModel(EventsHashTagsModel)
    private eventHashTagsModel: typeof EventsHashTagsModel,
    @InjectModel(HashTagModel) private hashTagModel: typeof HashTagModel,
  ) {
    this.stripe = new Stripe(
      this.configService.get<string>('STRIPE_SECRET_KEY'),
      {
        apiVersion: '2023-08-16',
      },
    );
    this.razorpay = new Razorpay({
      key_id: 'YOUR_RAZORPAY_KEY_ID',
      key_secret: 'YOUR_RAZORPAY_KEY_SECRET',
    });
  }

  public async createEvent(events: CreateEventInput): Promise<EventsModel> {
    const eventSubResults = await this.eventSubTypesModel.findOne({
      where: { value_info: events.event_sub_type_name },
    });
    if (!eventSubResults) {
      throw new NotFoundException(
        `${events.event_sub_type_name} event sub type not found`,
      );
    } else {
      const getStatus = await this.dataStatusModel.findOne({
        where: { status_number: events.status_number },
      });
      if (!getStatus) {
        throw new NotFoundException(`${events.status_number} not found`);
      } else {
        const eventInput = new EventsModel();
        eventInput.title = events.title;
        eventInput.description = events.description;
        eventInput.image = events.image;
        eventInput.city = events.city;
        eventInput.status = events.status;
        eventInput.country = events.country;
        eventInput.state = events.state;
        eventInput.event_time = events.event_time;
        eventInput.event_date = events.event_date;
        eventInput.userId = events.userId;
        eventInput.contact = events.contact;
        eventInput.address = events.address;
        eventInput.eventSubTypesId = eventSubResults.dataValues.id;
        eventInput.status_id = getStatus.dataValues.id;

        const eventsResults = await this.eventsModel.create(
          eventInput.dataValues,
        );
        return eventsResults;
      }
    }
  }

  public async updateEvent(
    id: string,
    events: UpdateEventInput,
  ): Promise<EventsModel> {
    const eventInput = await this.eventsModel.findOne({ where: { id } });
    if (!eventInput) {
      throw new NotFoundException(`${id} not found`);
    } else {
      eventInput.title = events.title;
      eventInput.description = events.description;
      eventInput.image = events.image;
      eventInput.city = events.city;
      eventInput.status = events.status;
      eventInput.country = events.country;
      eventInput.state = events.state;
      eventInput.event_time = events.event_time;
      eventInput.event_date = events.event_date;
      eventInput.contact = events.contact;
      eventInput.address = events.address;

      await this.eventsModel.update(eventInput.dataValues, { where: { id } });
      return eventInput;
    }
  }

  public async deleteEvent(id: string): Promise<EventsModel> {
    const eventInput = await this.eventsModel.findOne({ where: { id } });
    if (!eventInput) {
      throw new NotFoundException(`${id} not found`);
    } else {
      await this.eventsModel.destroy({ where: { id } });
      return eventInput;
    }
  }

  public async getEvents(): Promise<Array<EventsModel>> {
    const eventInput = await this.eventsModel
      .scope([
        { method: ['users'] },
        { method: ['user_events'] },
        { method: ['event_sub_types'] },
        { method: ['events_rating_event'] },
        { method: ['events_feedback_event'] },
        { method: ['event_prices'] },
        { method: ['event_cities'] },
        { method: ['event_services'] },
        { method: ['event_images'] },
        { method: ['event_status'] },
        { method: ['hash_tags'] },
      ])
      .findAll();
    return eventInput;
  }

  public async getEvent(id: string): Promise<EventsModel> {
    const eventInput = await this.eventsModel
      .scope([
        { method: ['users'] },
        { method: ['user_events'] },
        { method: ['event_sub_types'] },
        { method: ['events_rating_event'] },
        { method: ['events_feedback_event'] },
        { method: ['event_prices'] },
        { method: ['event_cities'] },
        { method: ['event_services'] },
        { method: ['event_images'] },
        { method: ['event_status'] },
        { method: ['hash_tags'] },
      ])
      .findOne({ where: { id } });
    return eventInput;
  }

  public async enrollEvents(
    events: CreateUsersEventsInput,
  ): Promise<UsersEventsModel> {
    const userEventRegister = await this.usersEventsModel.findOne({
      where: { userId: events.userId, eventId: events.eventId },
    });
    if (userEventRegister !== null) {
      throw new ConflictException(
        `User with id ${events.userId} is already registered in event id ${events.eventId}`,
      );
    } else {
      const getStatus = await this.dataStatusModel.findOne({
        where: { status_number: events.status_number },
      });
      if (!getStatus) {
        throw new NotFoundException(`${events.status_number} not found`);
      } else {
        const eventInput = new UsersEventsModel();
        eventInput.eventId = events.eventId;
        eventInput.userId = events.userId;
        eventInput.is_active = events.is_active;
        eventInput.status_id = getStatus.dataValues.id;

        const eventsResults = await this.usersEventsModel.create(
          eventInput.dataValues,
        );
        return eventsResults;
      }
    }
  }

  public async getPlannerCreatedEvents(
    userId: string,
  ): Promise<Array<EventsModel>> {
    const eventInput = await this.eventsModel
      .scope([
        { method: ['users'] },
        { method: ['user_events'] },
        { method: ['event_sub_types'] },
        { method: ['events_rating_event'] },
        { method: ['events_feedback_event'] },
        { method: ['event_prices'] },
        { method: ['event_cities'] },
        { method: ['event_services'] },
        { method: ['event_images'] },
        { method: ['event_status'] },
        { method: ['hash_tags'] },
      ])
      .findAll({ where: { userId } });
    return eventInput;
  }

  public async createEventHashTag(
    inputs: CreateEventHashTagInput,
  ): Promise<EventsHashTagsModel> {
    const eventThere = await this.eventsModel.findOne({
      where: { id: inputs.event_id },
    });
    if (!eventThere) {
      throw new NotFoundException(`no event found`);
    } else {
      const hashTagsThere = await this.hashTagModel.findOne({
        where: { id: inputs.hash_tag_id },
      });
      if (!hashTagsThere) {
        throw new NotFoundException(`no hash tag found`);
      } else {
        const statusThere = await this.dataStatusModel.findOne({
          where: { status_number: inputs.status_number },
        });
        if (!statusThere) {
          throw new NotFoundException(`no status found`);
        } else {
          const inputEnter = new EventsHashTagsModel();
          inputEnter.status = inputs.status;
          inputEnter.status_id = statusThere.dataValues.id;
          inputEnter.hash_tag_id = hashTagsThere.dataValues.id;
          inputEnter.event_id = eventThere.dataValues.id;
          const sendInputs = await this.eventHashTagsModel.create(
            inputEnter.dataValues,
          );
          return sendInputs;
        }
      }
    }
  }
}
