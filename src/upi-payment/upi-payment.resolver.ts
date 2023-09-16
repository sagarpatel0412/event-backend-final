import { Resolver, Query, Mutation, Args, Int } from '@nestjs/graphql';
import { UpiPaymentService } from './upi-payment.service';
import { CreateUpiPaymentInput } from './dto/create-upi-payment.input';
import { UpdateUpiPaymentInput } from './dto/update-upi-payment.input';
import { UpiPaymentModel } from './model/upi-payment.model';
import { AllowUnauthorized } from 'src/auth/decorators/allow-unauthorized.decorator';

@Resolver(() => UpiPaymentModel)
export class UpiPaymentResolver {
  constructor(private readonly upiPaymentService: UpiPaymentService) {}

  @AllowUnauthorized()
  @Query(() => [UpiPaymentModel])
  getUpiPayments() {
    return this.upiPaymentService.getUpiPayments();
  }

  @AllowUnauthorized()
  @Mutation(() => UpiPaymentModel)
  createUpiPayments(
    @Args('amount') amount: number,
    @Args('currency') currency: string,
    @Args('userId') userId: string,
    @Args('eventId') eventId: string,
  ) {
    return this.upiPaymentService.createUpiPayments(
      amount,
      currency,
      userId,
      eventId,
    );
  }
}
