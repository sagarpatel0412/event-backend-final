import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUpiPaymentInput } from './dto/create-upi-payment.input';
import { UpdateUpiPaymentInput } from './dto/update-upi-payment.input';
import { InjectModel } from '@nestjs/sequelize';
import { UpiPaymentModel } from './model/upi-payment.model';
import { Sequelize } from 'sequelize-typescript';
import Razorpay = require('razorpay');
import { ConfigService } from '@nestjs/config';
import { UserModel } from 'src/user/model/user.model';
import { EventsModel } from 'src/events/model/events.model';

@Injectable()
export class UpiPaymentService {
  private razorpay: Razorpay;
  constructor(
    @InjectModel(UpiPaymentModel)
    private upiPaymentModel: typeof UpiPaymentModel,
    @InjectModel(UserModel)
    private userModel: typeof UserModel,
    @InjectModel(EventsModel)
    private eventsModel: typeof EventsModel,
    private sequelize: Sequelize,
    private configService: ConfigService,
  ) {
    this.razorpay = new Razorpay({
      key_id: this.configService.get<string>('RAZORPAY_KEY_ID'),
      key_secret: this.configService.get<string>('RAZORPAY_KEY_SECRET'),
    });
  }

  public async getUpiPayments(): Promise<Array<UpiPaymentModel>> {
    const payment = await this.upiPaymentModel.findAll();
    return payment;
  }

  public async createUpiPayments(
    amount: number,
    currency: string,
    userId: string,
    eventId: string,
  ): Promise<UpiPaymentModel> {
    const findUser = await this.userModel.findOne({ where: { id: userId } });
    if (!findUser) {
      throw new NotFoundException(`${userId} not found`);
    } else {
      // const customer = await this.razorpay.customers.create();
      const findEvent = await this.eventsModel.findOne({
        where: { id: eventId },
      });
      if (!findEvent) {
        throw new NotFoundException(`${eventId} not found`);
      } else {
        // const options = {
        //   name: findUser.dataValues.firstname,
        //   email: findUser.dataValues.email,
        //   contact: '+919876543211',
        // };
        // const customer = await this.razorpay.customers.create(options);
        // console.log('customer', customer);
        const order = await this.razorpay.orders.create({
          amount: amount,
          currency: currency,
          receipt: `receipt#1`,
          payment_capture: true,
          notes: {
            key1: 'value3',
            key2: 'value2',
            description: `payment of ${userId} of event ${eventId}`,
          },
          // customer_id: customer.id,
        });
        console.log('order', order);
        if (Object.keys(order).length > 0) {
          if (Object.prototype.hasOwnProperty.call(order, 'error')) {
            throw new NotFoundException(`order didnt placed due to some error`);
          } else {
            const paymentId = order?.id;
            console.log('paymentid', paymentId);
            const payment = await this.razorpay.payments.capture(
              // paymentId
              paymentId,
              amount, // Amount in paise (e.g., for ₹10, provide 1000)
              currency,
            );
            console.log('payment', payment);
            if (Object.keys(payment).length > 0) {
              if (Object.prototype.hasOwnProperty.call(payment, 'error')) {
                throw new NotFoundException(
                  `payment didnt captured due to some error`,
                );
              } else {
                const payEntry = new UpiPaymentModel();
                payEntry.amount = amount.toString();
                payEntry.currency_code = currency;
                payEntry.payment_mode = 'upi';
                payEntry.razorpay_payment_id = payment.id;
                payEntry.razorpay_invoice_id =
                  payment.invoice_id !== null ? payment.invoice_id : '';
                payEntry.razorpay_payment_status_completed = payment.status;
                payEntry.razorpay_payment_status = true;
                payEntry.razorpay_order_id = payment.order_id;
                payEntry.status = true;
                payEntry.status_id = '312dea0b-d6b4-4f8c-b6e9-72b7d43423da';
                payEntry.user_id = userId;
                payEntry.events_id = eventId;
                const payDone = await this.upiPaymentModel.create(
                  payEntry.dataValues,
                );
                return payDone;
              }
            } else {
              throw new NotFoundException(`payment api failed`);
            }
          }
        } else {
          throw new NotFoundException(`order api failed`);
        }

        // const payEvent = new UpiPaymentModel();
      }
    }
  }

  // public async createUpiPayment(
  //   amount: number,
  // ): Promise<Array<UpiPaymentModel>> {
  //   const options = {
  //     name: 'John Doe1',
  //     email: 'john1@example.com',
  //     contact: '+919876543211',
  //   };
  //   const customer = await this.razorpay.customers.create(options);
  //   const a = {
  //     amount: amount,
  //     currency: 'INR',
  //     method: 'upi',
  //     receipt: 'order_receipt',
  //     notes: {
  //       description: 'Payment for order #1234',
  //     },
  //     token: ['buisness'],
  //     customer_id: customer.id,
  //   };
  //   const order = await this.razorpay.orders.create({
  //     amount: 50000,
  //     currency: 'INR',
  //     receipt: 'receipt#1',
  //     notes: {
  //       key1: 'value3',
  //       key2: 'value2',
  //     },
  //     customer_id: customer.id,
  //   });
  //   console.log('order', order);
  //   const payment = await this.upiPaymentModel.findAll();
  //   return payment;
  // }
}
