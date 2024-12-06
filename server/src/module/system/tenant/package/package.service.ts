
import { InjectRepository } from '@nestjs/typeorm';
import { Repository ,Not ,In,Like} from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { CreatePackageDto, UpdatePackageDto, QueryPackageDto } from './dto/package.dto';
import { SysTenantPackageEntity } from './entity/tenant.package.entity';

@Injectable()
export class SysTenantPackageService {
constructor(
    @InjectRepository(SysTenantPackageEntity)
    private readonly packageEntityRep: Repository<SysTenantPackageEntity>,
) {}
    async create(createPackageDto: CreatePackageDto) {
        const res = await this.packageEntityRep.save(createPackageDto);
        return ResultData.ok(res);
    }

    async findAll(query :QueryPackageDto ) {
        const entity = this.packageEntityRep.createQueryBuilder('entity');
        entity.where({ delFlag: '0'});
	if(query.packageName){
          entity.andWhere("entity.packageName LIKE :packageName", {packageName: `%${query.packageName}%`});
        }
        entity.select(["entity.packageId","entity.packageName","entity.menuIds","entity.menuCheckStrictly","entity.createTime"])
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
        const res = await this.packageEntityRep.findOne({
            where: {
                delFlag: '0',
                packageId: id,
            },
        });
        return ResultData.ok(res);
    }

    async update(updatePackageDto: UpdatePackageDto) {
        const res = await this.packageEntityRep.update({  packageId: updatePackageDto.packageId }, updatePackageDto);
        return ResultData.ok({value:res.affected >= 1});
    }

    async remove(id: number) {
        const res = await this.packageEntityRep.update(
            { packageId: id },
            {
                delFlag: '1',
            },
        );
        return ResultData.ok({value:res.affected >= 1});
    }
}
