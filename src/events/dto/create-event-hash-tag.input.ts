import { Field, InputType, Int } from '@nestjs/graphql';
import {
  IsNotEmpty,
  IsString,
  IsBoolean,
  IsInt,
  IsNumber,
} from 'class-validator';

@InputType()
export class CreateEventHashTagInput {
  @IsNotEmpty()
  @IsInt()
  @IsNumber()
  @Field(() => Int)
  status_number: number;

  @IsNotEmpty()
  @IsString()
  @Field(() => String)
  event_id: string;

  @IsNotEmpty()
  @IsString()
  @Field(() => String)
  hash_tag_id: string;

  @IsNotEmpty()
  @IsBoolean()
  @Field(() => Boolean)
  status: boolean;
}
