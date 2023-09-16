import { Module } from '@nestjs/common';
import { EventServiceImageService } from './event-service-image.service';
import { EventServiceImageResolver } from './event-service-image.resolver';
import { SequelizeModule } from '@nestjs/sequelize';
import { EventServiceImageModel } from './model/event-service-image.model';
import { EventServiceModel } from 'src/event-service/model/event-service.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';

@Module({
  imports: [
    SequelizeModule.forFeature([
      EventServiceImageModel,
      EventServiceModel,
      DataStatusModel,
    ]),
  ],
  providers: [EventServiceImageResolver, EventServiceImageService],
})
export class EventServiceImageModule {}
