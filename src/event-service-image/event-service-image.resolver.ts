import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { EventServiceImageService } from './event-service-image.service';
import { CreateEventServiceImageInput } from './dto/create-event-service-image.input';
import { UpdateEventServiceImageInput } from './dto/update-event-service-image.input';
import { EventServiceImageModel } from './model/event-service-image.model';
import { AllowUnauthorized } from 'src/auth/decorators/allow-unauthorized.decorator';

@Resolver(() => EventServiceImageModel)
export class EventServiceImageResolver {
  constructor(
    private readonly eventServiceImageService: EventServiceImageService,
  ) {}

  @AllowUnauthorized()
  @Mutation(() => EventServiceImageModel)
  createEventServiceImage(
    @Args('createEventServiceImageInput')
    createEventServiceImageInput: CreateEventServiceImageInput,
  ) {
    return this.eventServiceImageService.createEventServiceImage(
      createEventServiceImageInput,
    );
  }

  @AllowUnauthorized()
  @Query(() => [EventServiceImageModel])
  getEventServiceImages() {
    return this.eventServiceImageService.getEventServiceImages();
  }

  @AllowUnauthorized()
  @Query(() => EventServiceImageModel)
  getEventServiceImage(@Args('id') id: string) {
    return this.eventServiceImageService.getEventServiceImage(id);
  }

  @AllowUnauthorized()
  @Mutation(() => EventServiceImageModel)
  updateEventServiceImage(
    @Args('id') id: string,
    @Args('updateEventServiceImageInput')
    updateEventServiceImageInput: UpdateEventServiceImageInput,
  ) {
    return this.eventServiceImageService.updateEventServiceImage(
      id,
      updateEventServiceImageInput,
    );
  }

  @AllowUnauthorized()
  @Mutation(() => EventServiceImageModel)
  deleteEventServiceImage(@Args('id') id: string) {
    return this.eventServiceImageService.deleteEventServiceImage(id);
  }
}
