import { Field, Int, ObjectType } from '@nestjs/graphql';
import {
  BeforeValidate,
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
import { EventsModel } from 'src/events/model/events.model';
import { UserModel } from 'src/user/model/user.model';

@ObjectType('UpiPayment')
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
  events: () => {
    return {
      include: {
        model: EventsModel,
        as: 'events',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
  upi_payment_status: () => {
    return {
      include: {
        model: DataStatusModel,
        as: 'upi_payment_status',
        attributes: {
          exclude: ['created_at', 'updated_at'],
        },
      },
    };
  },
})
@Table({ modelName: 'upi_payments' })
export class UpiPaymentModel extends Model<UpiPaymentModel> {
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
  amount: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  currency_code: string;

  @Field(() => Date)
  @Column({
    type: DataType.DATE,
    defaultValue: DataType.NOW,
    allowNull: false,
  })
  payment_date: Date;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  payment_mode: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  razorpay_payment_id: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  razorpay_invoice_id: string;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  razorpay_payment_status_completed: string;

  @Field(() => Boolean)
  @Column({
    type: DataType.BOOLEAN,
    allowNull: false,
  })
  razorpay_payment_status: boolean;

  @Field(() => Int)
  @Column({
    type: DataType.BIGINT,
    allowNull: false,
    unique: true,
  })
  order_id: number;

  @Field(() => String)
  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  razorpay_order_id: string;

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
  upi_payment_status: DataStatusModel;

  @ForeignKey(() => UserModel)
  @Column({ field: 'user_id' })
  user_id: string;

  @Field(() => UserModel, { nullable: true })
  @BelongsTo(() => UserModel)
  users: UserModel;

  @ForeignKey(() => EventsModel)
  @Column({ field: 'events_id' })
  events_id: string;

  @Field(() => EventsModel, { nullable: true })
  @BelongsTo(() => EventsModel)
  events: EventsModel;

  @BeforeValidate
  static generateRandomUniqueNumber(instance: UpiPaymentModel): void {
    instance.order_id = Math.floor(Math.random() * 10000000000); // Generate random 11-digit number
  }
}
