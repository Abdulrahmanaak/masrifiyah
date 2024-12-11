import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { SignupService } from './sign-up.service';
import { Signup } from './signup.schema';

@Controller('signup')
export class SignupController {
  constructor(private readonly signupService: SignupService) {}

  @Post()
  async create(@Body() signupData: Partial<Signup>): Promise<Signup> {
    return this.signupService.create(signupData);
  }

  @Get()
  async findAll(): Promise<Signup[]> {
    return this.signupService.findAll();
  }

  @Get(':email')
  async findOne(@Param('email') email: string): Promise<Signup | null> {
    return this.signupService.findOne(email);
  }

  @Delete(':email')
  async delete(@Param('email') email: string): Promise<Signup | null> {
    return this.signupService.delete(email);
  }
}
