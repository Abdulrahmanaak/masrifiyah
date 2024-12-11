import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { SigninController } from './signin.controller';
import { SigninService } from './signin.service';
import { SigninSchema } from './signin.schema';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: 'Signin', schema: SigninSchema }]),
  ],
  controllers: [SigninController],
  providers: [SigninService],
})
export class SigninModule {}
