import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Signin } from './signin.schema';

@Injectable()
export class SigninService {
  constructor(
    @InjectModel('Signin') private readonly signinModel: Model<Signin>,
  ) {}

  async create(signinData: Partial<Signin>): Promise<Signin> {
    const newSignin = new this.signinModel(signinData);
    return newSignin.save();
  }

  async findAll(): Promise<Signin[]> {
    return this.signinModel.find().exec();
  }

  async findOne(email: string): Promise<Signin | null> {
    return this.signinModel.findOne({ email }).exec();
  }

  async delete(email: string): Promise<Signin | null> {
    return this.signinModel.findOneAndDelete({ email }).exec();
  }
}
