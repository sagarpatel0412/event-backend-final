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
import { UserModel } from './user.model';

@Table({ modelName: 'user_teams' })
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
  team_members: () => {
    return {
      include: {
        model: UserModel,
        as: 'team_members',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
})
@ObjectType('UserTeamsModel')
export class UserTeamModel extends Model<UserTeamModel> {
  @Field(() => String)
  @Column({
    type: DataType.UUIDV4,
    primaryKey: true,
    unique: true,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  id: string;

  @ForeignKey(() => UserModel)
  @Column({ field: 'user_id' })
  user_id: string;

  @Field(() => UserModel, { nullable: true })
  @BelongsTo(() => UserModel, { foreignKey: 'user_id' })
  users: UserModel;

  @ForeignKey(() => UserModel)
  @Column({ field: 'team_member_id' })
  team_member_id: string;

  @Field(() => UserModel, { nullable: true })
  @BelongsTo(() => UserModel, { foreignKey: 'team_member_id' })
  team_members: UserModel;

  @CreatedAt
  created_at: Date;

  @UpdatedAt
  updated_at: Date;
}
