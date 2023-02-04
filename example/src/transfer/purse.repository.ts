/*NdegwaCodes*/
import { DataSource, DataSourceOptions, EntityRepository, Repository } from 'typeorm';
import { Purse } from './model/purse.model';
import { Maybe } from '../tools';
import { Config } from '../config';


@EntityRepository(Purse)
export class PurseRepository extends Repository<Purse> {
  async findPurseById(purseId: number): Promise<Maybe<Purse>> {
    return await this.findOne({ where: { id: purseId } });
  }
}

export const NewPurseRepository = new DataSource(Config.typeOrmConfig as DataSourceOptions).getRepository(Purse).extend({
  async findPurseById(purseId: number): Promise<Maybe<Purse>> {
    return await this.findOne({ where: { id: purseId } });
  },
});