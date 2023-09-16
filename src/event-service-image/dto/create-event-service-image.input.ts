import { InputType, Int, Field } from '@nestjs/graphql';
import {
  IsBoolean,
  IsInt,
  IsNotEmpty,
  IsNumber,
  IsString,
} from 'class-validator';

@InputType()
export class CreateEventServiceImageInput {
  @IsNotEmpty()
  @IsString()
  @Field(() => String)
  image: string;

  @IsNotEmpty()
  @IsBoolean()
  @Field(() => Boolean)
  status: boolean;

  @IsNotEmpty()
  @IsString()
  @Field(() => String)
  event_service_id: string;

  @IsNotEmpty()
  @IsInt()
  @IsNumber()
  @Field(() => Int)
  status_number: number;
}
