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
import { PostCommentModel } from 'src/post-comment/model/post-comment.model';
import { PostLikeModel } from 'src/post-like/model/post-like.model';
import { UserModel } from '../../user/model/user.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { BlogImageModel } from 'src/blog-image/model/blog-image.model';
import { HashTagModel } from 'src/hash-tag/model/hash-tag.model';
import { CelestialPostHashTagModel } from './celestial-post-hash-tag.model';

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
  likes: () => {
    return {
      include: {
        model: PostLikeModel,
        as: 'likes',
        include: [
          {
            model: UserModel,
            as: 'users',
            required: false,
          },
        ],
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  comments: () => {
    return {
      include: {
        model: PostCommentModel,
        as: 'comments',
        include: [
          {
            model: UserModel,
            as: 'users',
            required: false,
          },
        ],
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  post_users_likes: () => {
    return {
      include: {
        model: UserModel,
        as: 'post_users_likes',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  posts_users_comments: () => {
    return {
      include: {
        model: UserModel,
        as: 'posts_users_comments',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  posts_status: () => {
    return {
      include: {
        model: DataStatusModel,
        as: 'posts_status',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  post_images: () => {
    return {
      include: {
        model: BlogImageModel,
        as: 'post_images',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  celestial_posts_hash_tags: () => {
    return {
      include: {
        model: HashTagModel,
        as: 'celestial_posts_hash_tags',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  // hash_tags: () => {
  //   return {
  //     include: {
  //       model: HashTagModel,
  //       as: 'hash_tags',
  //       attributes: {
  //         exclude: ['created_at', 'updated_at'],
  //       },
  //     },
  //   };
  // },
})
@ObjectType('CelestialPost')
@Table({ modelName: 'celestial_post' })
export class CelestialPostModel extends Model<CelestialPostModel> {
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
  image: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  title: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  description: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  metatitle: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  metadescription: string;

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
  userId: string;

  @Field(() => UserModel)
  @BelongsTo(() => UserModel)
  users: UserModel;

  @Field(() => [PostLikeModel], { nullable: true })
  @HasMany(() => PostLikeModel)
  likes: PostLikeModel[];

  @Field(() => [PostCommentModel], { nullable: true })
  @HasMany(() => PostCommentModel)
  comments: PostCommentModel[];

  @Field(() => [UserModel], { nullable: true })
  @BelongsToMany(() => UserModel, () => PostLikeModel)
  post_users_likes: UserModel[];

  @Field(() => [UserModel], { nullable: true })
  @BelongsToMany(() => UserModel, () => PostCommentModel)
  posts_users_comments: UserModel[];

  @ForeignKey(() => DataStatusModel)
  @Column({ field: 'status_id' })
  status_id: string;

  @Field(() => DataStatusModel, { nullable: true })
  @BelongsTo(() => DataStatusModel)
  posts_status: DataStatusModel;

  @Field(() => [BlogImageModel], { nullable: true })
  @HasMany(() => BlogImageModel)
  post_images: BlogImageModel[];

  @Field(() => [HashTagModel], { nullable: true })
  @BelongsToMany(() => HashTagModel, () => CelestialPostHashTagModel)
  celestial_posts_hash_tags: HashTagModel[];

  // @Field(() => [HashTagModel], { nullable: true })
  // @HasMany(() => HashTagModel)
  // hash_tags: HashTagModel[];
}
