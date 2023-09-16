import { Test, TestingModule } from '@nestjs/testing';
import { UpiPaymentResolver } from './upi-payment.resolver';
import { UpiPaymentService } from './upi-payment.service';

describe('UpiPaymentResolver', () => {
  let resolver: UpiPaymentResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UpiPaymentResolver, UpiPaymentService],
    }).compile();

    resolver = module.get<UpiPaymentResolver>(UpiPaymentResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
