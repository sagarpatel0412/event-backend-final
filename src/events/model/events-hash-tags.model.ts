import { Field, ObjectType } from '@nestjs/graphql';
import {
  BelongsTo,
  Column,
  CreatedAt,
  DataType,
  ForeignKey,
  Model,
  Table,
  UpdatedAt,
} from 'sequelize-typescript';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { EventsModel } from './events.model';
import { HashTagModel } from 'src/hash-tag/model/hash-tag.model';

@ObjectType('EventsHashTagsModel')
@Table({ modelName: 'events_hash_tags' })
export class EventsHashTagsModel extends Model<EventsHashTagsModel> {
  @Field(() => String)
  @Column({
    type: DataType.UUIDV4,
    primaryKey: true,
    unique: true,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  id: string;

  @ForeignKey(() => DataStatusModel)
  @Column({ field: 'status_id' })
  status_id: string;

  @Field(() => DataStatusModel, { nullable: true })
  @BelongsTo(() => DataStatusModel)
  events_hash_tag_statuses: DataStatusModel;

  @ForeignKey(() => EventsModel)
  @Column({ field: 'event_id' })
  event_id: string;

  @Field(() => EventsModel, { nullable: true })
  @BelongsTo(() => EventsModel)
  events: EventsModel;

  @ForeignKey(() => HashTagModel)
  @Column({ field: 'hash_tag_id' })
  hash_tag_id: string;

  @Field(() => HashTagModel, { nullable: true })
  @BelongsTo(() => HashTagModel)
  hash_tags: HashTagModel;

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
}
