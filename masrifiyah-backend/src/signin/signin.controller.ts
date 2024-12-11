import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { SigninService } from './signin.service';
import { Signin } from './signin.schema';

@Controller('signin')
export class SigninController {
  constructor(private readonly signinService: SigninService) {}

  @Post()
  async create(@Body() signinData: Partial<Signin>): Promise<Signin> {
    return this.signinService.create(signinData);
  }

  // @Get()
  // async findAll(): Promise<Signin[]> {
  //   return this.signinService.findAll();
  // }

  @Get(':email')
  async findOne(@Param('email') email: string): Promise<Signin | null> {
    return this.signinService.findOne(email);
  }

  @Delete(':email')
  async delete(@Param('email') email: string): Promise<Signin | null> {
    return this.signinService.delete(email);
  }
}
