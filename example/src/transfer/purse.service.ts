
import { HttpException, Injectable } from '@nestjs/common';
import { isNotDefined } from '../tools';
import { Purse } from './model/purse.model';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class PurseService {
  constructor(
    
    @InjectRepository(Purse)
    private readonly purePurseRepository: Repository<Purse>,
  ) {
  }

  async findPurseById(purseId: number): Promise<Purse> {
    const purse = await this.purePurseRepository.findOne({ where: { id: purseId } });
    if (isNotDefined(purse)) {
      throw new HttpException(`NOT FOUND WALLET WITH ID "${purseId}"`, 404);
    }
    return purse;
  }

  async savePurse(purse: Purse): Promise<Purse> {
    return this.purePurseRepository.save(purse);
  }
}