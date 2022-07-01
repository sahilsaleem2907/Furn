import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Data } from './data.model';

@Injectable()
export class DataService {
  constructor(@InjectModel('Data') private readonly dataModel: Model<Data>) {}

  async getData() {
    const data = await this.dataModel.find().exec();
    return data.map(data => ({
      id: data.numb,
      title: data.title,
      price: data.price,
      category: data.category,
      image: data.image,
      subTitle: data.subTitle,
      description: data.description,
    }));
  }
}
