import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class HashTag {
  @Field(() => Int, { description: 'Example field (placeholder)' })
  exampleField: number;
}
