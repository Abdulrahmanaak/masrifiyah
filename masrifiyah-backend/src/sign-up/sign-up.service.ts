import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Signup } from './signup.schema';

@Injectable()
export class SignupService {
  constructor(
    @InjectModel('Signup') private readonly signupModel: Model<Signup>,
  ) {}

  async create(signupData: Partial<Signup>): Promise<Signup> {
    const newSignup = new this.signupModel(signupData);
    return newSignup.save();
  }

  async findAll(): Promise<Signup[]> {
    return this.signupModel.find().exec();
  }

  async findOne(email: string): Promise<Signup | null> {
    return this.signupModel.findOne({ email }).exec();
  }

  async delete(email: string): Promise<Signup | null> {
    return this.signupModel.findOneAndDelete({ email }).exec();
  }
}
