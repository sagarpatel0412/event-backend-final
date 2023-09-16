import { Field, ObjectType } from '@nestjs/graphql';
import {
  BelongsTo,
  Column,
  CreatedAt,
  DataType,
  ForeignKey,
  Model,
  Scopes,
  Table,
  UpdatedAt,
} from 'sequelize-typescript';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { EventServiceModel } from 'src/event-service/model/event-service.model';

@ObjectType('EventServiceImageModel')
@Scopes({
  event_services: () => {
    return {
      include: {
        model: EventServiceModel,
        as: 'event_services',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  event_service_image_status: () => {
    return {
      include: {
        model: DataStatusModel,
        as: 'event_service_image_status',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
})
@Table({ modelName: 'event_service_images' })
export class EventServiceImageModel extends Model<EventServiceImageModel> {
  @Field(() => String)
  @Column({
    type: DataType.UUIDV4,
    allowNull: false,
    primaryKey: true,
    defaultValue: DataType.UUIDV4,
    unique: true,
  })
  id: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  image: string;

  @Field(() => Boolean)
  @Column({
    type: DataType.BOOLEAN,
    allowNull: false,
  })
  status: boolean;

  @CreatedAt
  created_at: Date;

  @UpdatedAt
  updated_at: Date;

  @ForeignKey(() => DataStatusModel)
  @Column({ field: 'status_id' })
  status_id: string;

  @Field(() => DataStatusModel, { nullable: true })
  @BelongsTo(() => DataStatusModel)
  event_service_image_status: DataStatusModel;

  @ForeignKey(() => EventServiceModel)
  @Column({ field: 'event_service_id' })
  event_service_id: string;

  @Field(() => EventServiceModel, { nullable: true })
  @BelongsTo(() => EventServiceModel)
  event_services: EventServiceModel;
}
