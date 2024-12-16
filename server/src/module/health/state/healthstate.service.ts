
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { CreateStateDto, UpdateStateDto, QueryStateDto } from './dto/index';
import { HealthStateEntity } from './entity/state.entity';

@Injectable()
export class HealthStateService {
    constructor(
        @InjectRepository(HealthStateEntity)
        private readonly stateEntityRep: Repository<HealthStateEntity>,
    ) {}
    async create(createStateDto: CreateStateDto) {
        const res = await this.stateEntityRep.save(createStateDto);
        return ResultData.ok(res);
    }

    async findAll(query :QueryStateDto ) {
        const entity = this.stateEntityRep.createQueryBuilder('entity');
        entity.where({ delFlag: '0'});
        entity.select(["entity.healthStateId","entity.status","entity.remark","entity.healthStateTag","entity.healthStateContent","entity.healthStateImg","entity.tenantCode","entity.userId"])
        if (query.orderByColumn && query.isAsc) {
            const key = query.isAsc === 'ascending' ? 'ASC' : 'DESC';
            entity.orderBy(`entity.${query.orderByColumn}`, key);
        }
        entity.skip(query.pageSize * (query.pageNum - 1)).take(query.pageSize);
        const [list, total] = await entity.getManyAndCount();

        return ResultData.ok({
            list,
            total,
        });
    }

    async findOne(id: number) {
        const res = await this.stateEntityRep.findOne({
            where: {
                delFlag: '0',
                healthStateId: id,
            },
        });
        return ResultData.ok(res);
    }

    async update(updateStateDto: UpdateStateDto) {
        const res = await this.stateEntityRep.update({  healthStateId: updateStateDto.healthStateId }, updateStateDto);
        return ResultData.ok({value:res.affected >= 1});
    }

    async remove(id: number) {
        const res = await this.stateEntityRep.update(
            { healthStateId: id },
            {
                delFlag: '1',
            },
        );
        return ResultData.ok({value:res.affected >= 1});
    }
}
