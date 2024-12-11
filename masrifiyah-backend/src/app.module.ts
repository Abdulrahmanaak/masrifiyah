import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { MongooseModule } from '@nestjs/mongoose';
import { ConfigModule } from '@nestjs/config';

import { SigninModule } from './signin/signin.module';
import { SignupModule } from './sign-up/sign-up.module';

@Module({
  imports: [ConfigModule.forRoot({ isGlobal: true }),  // Automatically loads .env file
    MongooseModule.forRoot("mongodb+srv://daleh:Dalleh123@cluster0.ul2ia.mongodb.net/Maeen?retryWrites=true&w=majority&appName=Cluster0Masrifiyah"), 
   SigninModule, SignupModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

