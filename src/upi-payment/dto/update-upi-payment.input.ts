import { CreateUpiPaymentInput } from './create-upi-payment.input';
import { InputType, Field, Int, PartialType } from '@nestjs/graphql';

@InputType()
export class UpdateUpiPaymentInput extends PartialType(CreateUpiPaymentInput) {
  @Field(() => Int)
  id: number;
}
