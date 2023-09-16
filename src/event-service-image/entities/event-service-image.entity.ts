import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class EventServiceImage {
  @Field(() => Int, { description: 'Example field (placeholder)' })
  exampleField: number;
}
