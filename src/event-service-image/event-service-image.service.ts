import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateEventServiceImageInput } from './dto/create-event-service-image.input';
import { UpdateEventServiceImageInput } from './dto/update-event-service-image.input';
import { EventServiceImageModel } from './model/event-service-image.model';
import { InjectModel } from '@nestjs/sequelize';
import { EventServiceModel } from 'src/event-service/model/event-service.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { Sequelize } from 'sequelize-typescript';

@Injectable()
export class EventServiceImageService {
  constructor(
    @InjectModel(EventServiceImageModel)
    private eventServiceImageModel: typeof EventServiceImageModel,
    @InjectModel(EventServiceModel)
    private eventServiceModel: typeof EventServiceModel,
    @InjectModel(DataStatusModel)
    private dataStatusModel: typeof DataStatusModel,
    private sequelize: Sequelize,
  ) {}

  public async createEventServiceImage(
    inputs: CreateEventServiceImageInput,
  ): Promise<EventServiceImageModel> {
    const getEventService = await this.eventServiceModel.findOne({
      where: { id: inputs.event_service_id },
    });
    if (!getEventService) {
      throw new NotFoundException(`Specific event service not found`);
    } else {
      const getStatus = await this.dataStatusModel.findOne({
        where: { status_number: inputs.status_number },
      });
      if (!getStatus) {
        throw new NotFoundException(`status number not found`);
      } else {
        const imageInputs = new EventServiceImageModel();
        imageInputs.status = inputs.status;
        imageInputs.event_service_id = getEventService.dataValues.id;
        imageInputs.image = inputs.image;
        imageInputs.status_id = getStatus.dataValues.id;
        const imageSave = await this.eventServiceImageModel.create(
          imageInputs.dataValues,
        );
        return imageSave;
      }
    }
  }

  public async updateEventServiceImage(
    id: string,
    inputs: UpdateEventServiceImageInput,
  ): Promise<EventServiceImageModel> {
    const getEventServiceImage = await this.eventServiceImageModel.findOne({
      where: { id: id },
    });
    if (!getEventServiceImage) {
      throw new NotFoundException(`not event service image found`);
    } else {
      getEventServiceImage.image = inputs.image;
      getEventServiceImage.status = inputs.status;
      await this.eventServiceImageModel.update(
        getEventServiceImage.dataValues,
        { where: { id: id } },
      );
      return getEventServiceImage;
    }
  }

  public async deleteEventServiceImage(
    id: string,
  ): Promise<EventServiceImageModel> {
    const getEventServiceImage = await this.eventServiceImageModel.findOne({
      where: { id: id },
    });
    if (!getEventServiceImage) {
      throw new NotFoundException(`not event service image found`);
    } else {
      await this.eventServiceImageModel.destroy({ where: { id: id } });
      return getEventServiceImage;
    }
  }

  public async getEventServiceImage(
    id: string,
  ): Promise<EventServiceImageModel> {
    const getEventServiceImage = await this.eventServiceImageModel
      .scope([
        { method: ['event_services'] },
        { method: ['event_service_image_status'] },
      ])
      .findOne({
        where: { id: id },
      });
    if (getEventServiceImage === null) {
      throw new NotFoundException(`not event service image found`);
    } else {
      return getEventServiceImage;
    }
  }

  public async getEventServiceImages(): Promise<Array<EventServiceImageModel>> {
    const getEventServiceImage = await this.eventServiceImageModel
      .scope([
        { method: ['event_services'] },
        { method: ['event_service_image_status'] },
      ])
      .findAll();
    return getEventServiceImage;
  }
}
