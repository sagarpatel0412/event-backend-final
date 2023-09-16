import { Test, TestingModule } from '@nestjs/testing';
import { EventServiceImageService } from './event-service-image.service';

describe('EventServiceImageService', () => {
  let service: EventServiceImageService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EventServiceImageService],
    }).compile();

    service = module.get<EventServiceImageService>(EventServiceImageService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
