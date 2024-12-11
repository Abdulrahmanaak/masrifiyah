import { Schema, Document } from 'mongoose';

export interface Signup extends Document {
  name: string;
  email: string;
  password: string;
  createdAt: Date;
}

export const SignupSchema = new Schema<Signup>({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  createdAt: { type: Date, default: Date.now },
});
