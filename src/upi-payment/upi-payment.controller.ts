import { Controller, Get, Req, Res } from '@nestjs/common';
import { Request, Response } from 'express';
import { AllowUnauthorized } from 'src/auth/decorators/allow-unauthorized.decorator';
import { UpiPaymentService } from './upi-payment.service';

@Controller('/upi-payment')
export class UpiPaymentController {
  constructor(private readonly upiPaymentService: UpiPaymentService) {}

  @AllowUnauthorized()
  @Get('/verify-payment')
  getPayment(@Req() req: Request, @Res() res: Response) {
    return res.send('hello world');
  }
}
