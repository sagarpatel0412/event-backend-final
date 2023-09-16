import { Test, TestingModule } from '@nestjs/testing';
import { HashTagResolver } from './hash-tag.resolver';
import { HashTagService } from './hash-tag.service';

describe('HashTagResolver', () => {
  let resolver: HashTagResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HashTagResolver, HashTagService],
    }).compile();

    resolver = module.get<HashTagResolver>(HashTagResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
