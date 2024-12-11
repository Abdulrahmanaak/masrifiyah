import { Schema, Document } from 'mongoose';

export interface Signin extends Document {
  email: string;
  password: string;
  createdAt: Date;
}

export const SigninSchema = new Schema<Signin>({
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  createdAt: { type: Date, default: Date.now },
});
