import * as mongoose from 'mongoose';

export const DataSchema = new mongoose.Schema({
  numb: { type: String, required: true },
  title: { type: String, required: true },
  subTitle: { type: String, required: true },
  description: { type: String, required: true },
  image: { type: String, required: true },
  category: { type: String, required: true },
  price: { type: Number, required: true },
});

export interface Data extends mongoose.Document {
  id: string;
  numb: string;
  title: string;
  subTitle: string;
  description: string;
  image: string;
  category: string;
  price: number;
}
