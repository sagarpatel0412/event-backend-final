import { Test, TestingModule } from '@nestjs/testing';
import { EventServiceImageResolver } from './event-service-image.resolver';
import { EventServiceImageService } from './event-service-image.service';

describe('EventServiceImageResolver', () => {
  let resolver: EventServiceImageResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EventServiceImageResolver, EventServiceImageService],
    }).compile();

    resolver = module.get<EventServiceImageResolver>(EventServiceImageResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
