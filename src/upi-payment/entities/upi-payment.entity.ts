import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class UpiPayment {
  @Field(() => Int, { description: 'Example field (placeholder)' })
  exampleField: number;
}
