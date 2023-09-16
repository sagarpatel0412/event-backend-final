import { Module } from '@nestjs/common';
import { UpiPaymentService } from './upi-payment.service';
import { UpiPaymentResolver } from './upi-payment.resolver';
import { SequelizeModule } from '@nestjs/sequelize';
import { UpiPaymentModel } from './model/upi-payment.model';
import { ConfigModule } from '@nestjs/config';
import { EventsModel } from 'src/events/model/events.model';
import { UserModel } from 'src/user/model/user.model';
import { UpiPaymentController } from './upi-payment.controller';

@Module({
  imports: [
    SequelizeModule.forFeature([UpiPaymentModel, EventsModel, UserModel]),
    ConfigModule.forRoot({ expandVariables: true }),
  ],
  providers: [UpiPaymentResolver, UpiPaymentService],
  controllers: [UpiPaymentController],
})
export class UpiPaymentModule {}
