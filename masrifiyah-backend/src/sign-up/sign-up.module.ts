import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { SignupController } from './sign-up.controller';
import { SignupService } from './sign-up.service';
import { SignupSchema } from './signup.schema';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: 'Signup', schema: SignupSchema }]),
  ],
  controllers: [SignupController],
  providers: [SignupService],
})
export class SignupModule {}
