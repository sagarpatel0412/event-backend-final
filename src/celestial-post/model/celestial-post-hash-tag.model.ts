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
import { CelestialPostModel } from './celestial-post.model';
import { HashTagModel } from 'src/hash-tag/model/hash-tag.model';

@ObjectType('CelestialPostHashTagModel')
@Table({ modelName: 'celestial_post_hash_tags' })
export class CelestialPostHashTagModel extends Model<CelestialPostHashTagModel> {
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
  celestial_post_hash_tag_statuses: DataStatusModel;

  @ForeignKey(() => CelestialPostModel)
  @Column({ field: 'celestial_post_id' })
  celestial_post_id: string;

  @Field(() => CelestialPostModel, { nullable: true })
  @BelongsTo(() => CelestialPostModel)
  posts: CelestialPostModel;

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
