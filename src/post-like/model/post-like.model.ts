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
import { CelestialPostModel } from 'src/celestial-post/model/celestial-post.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { UserModel } from 'src/user/model/user.model';

@Scopes({
  posts: () => {
    return {
      include: {
        model: CelestialPostModel,
        as: 'posts',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
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
  post_likes_status: () => {
    return {
      include: {
        model: DataStatusModel,
        as: 'post_likes_status',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
})
@ObjectType('PostLike')
@Table({ modelName: 'post_likes' })
export class PostLikeModel extends Model<PostLikeModel> {
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
  description: string;

  @Field(() => Boolean)
  @Column({
    type: DataType.BOOLEAN,
    allowNull: false,
  })
  likes: boolean;

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

  @ForeignKey(() => CelestialPostModel)
  @Column({ field: 'post_id' })
  postId: string;

  @Field(() => CelestialPostModel)
  @BelongsTo(() => CelestialPostModel)
  posts: CelestialPostModel;

  @ForeignKey(() => UserModel)
  @Column({ field: 'user_id' })
  userId: string;

  @Field(() => UserModel)
  @BelongsTo(() => UserModel)
  users: UserModel;

  @ForeignKey(() => DataStatusModel)
  @Column({ field: 'status_id' })
  status_id: string;

  @Field(() => DataStatusModel, { nullable: true })
  @BelongsTo(() => DataStatusModel)
  post_likes_status: DataStatusModel;
}
