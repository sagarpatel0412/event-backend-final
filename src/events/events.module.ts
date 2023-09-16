import { Module } from '@nestjs/common';
import { EventsService } from './events.service';
import { EventsResolver } from './events.resolver';
import { SequelizeModule } from '@nestjs/sequelize';
import { EventsModel } from './model/events.model';
import { UsersEventsModel } from './model/users-events.model';
import { EventSubTypesModel } from 'src/event-sub-types/model/event-sub-types.model';
import { ConfigModule } from '@nestjs/config';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { EventsHashTagsModel } from './model/events-hash-tags.model';
import { HashTagModel } from 'src/hash-tag/model/hash-tag.model';

@Module({
  imports: [
    ConfigModule.forRoot({ expandVariables: true }),
    SequelizeModule.forFeature([
      EventsModel,
      UsersEventsModel,
      EventSubTypesModel,
      DataStatusModel,
      EventsHashTagsModel,
      HashTagModel,
    ]),
  ],
  providers: [EventsResolver, EventsService],
  exports: [EventsService],
})
export class EventsModule {}
