import { InputType, Int, Field } from '@nestjs/graphql';

@InputType()
export class CreateUpiPaymentInput {
  @Field(() => Int, { description: 'Example field (placeholder)' })
  exampleField: number;
}
