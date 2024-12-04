import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DictService } from './dict.service';
import { DictController } from './dict.controller';
import { SysDictTypeEntity } from './entity/dict.type.entity';
import { SysDictDataEntity } from './entity/dict.data.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SysDictTypeEntity, SysDictDataEntity])],
  controllers: [DictController],
  providers: [DictService],
})
export class DictModule {}
