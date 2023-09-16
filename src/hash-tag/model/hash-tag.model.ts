import { Field, ObjectType } from '@nestjs/graphql';
import {
  BelongsTo,
  BelongsToMany,
  Column,
  CreatedAt,
  DataType,
  ForeignKey,
  HasMany,
  Model,
  Scopes,
  Table,
  UpdatedAt,
} from 'sequelize-typescript';
import { CelestialPostHashTagModel } from 'src/celestial-post/model/celestial-post-hash-tag.model';
import { CelestialPostModel } from 'src/celestial-post/model/celestial-post.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { EventsHashTagsModel } from 'src/events/model/events-hash-tags.model';
import { EventsModel } from 'src/events/model/events.model';
import { UserModel } from 'src/user/model/user.model';

@Scopes({
  users: () => {
    return {
      include: {
        model: UserModel,
        as: 'users',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  hashtag_statuses: () => {
    return {
      include: {
        model: DataStatusModel,
        as: 'hashtag_statuses',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  hash_tag_celestial_posts: () => {
    return {
      include: {
        model: CelestialPostModel,
        as: 'hash_tag_celestial_posts',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  hash_tags_events: () => {
    return {
      include: {
        model: EventsModel,
        as: 'hash_tags_events',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
})
@ObjectType('HashTagModel')
@Table({ modelName: 'hash_tags' })
export class HashTagModel extends Model<HashTagModel> {
  @Field(() => String)
  @Column({
    type: DataType.UUIDV4,
    primaryKey: true,
    unique: true,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  id: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  name: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  value_info: string;

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

  @ForeignKey(() => UserModel)
  @Column({ field: 'user_id' })
  user_id: string;

  @Field(() => UserModel, { nullable: true })
  @BelongsTo(() => UserModel)
  users: UserModel;

  @ForeignKey(() => DataStatusModel)
  @Column({ field: 'status_id' })
  status_id: string;

  @Field(() => DataStatusModel, { nullable: true })
  @BelongsTo(() => DataStatusModel)
  hashtag_statuses: DataStatusModel;

  @Field(() => [CelestialPostModel], { nullable: true })
  @BelongsToMany(() => CelestialPostModel, () => CelestialPostHashTagModel)
  hash_tag_celestial_posts: CelestialPostModel[];

  @Field(() => [EventsModel])
  @BelongsToMany(() => EventsModel, () => EventsHashTagsModel)
  hash_tags_events: EventsModel[];

  //   @Field(() => [CelestialPostModel], { nullable: true })
  //   @HasMany(() => CelestialPostModel)
  //   celestial_posts: CelestialPostModel[];
}
