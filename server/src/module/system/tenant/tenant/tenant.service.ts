import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import {CreateSysTenantDto, ListAllSysTenantDto, ListSysTenantDto, UpdateSysTenantDto} from './dto/tenant.dto';
import { SysTenantEntity } from './entity/tenant.entity';

@Injectable()
export class SysTenantService {
  constructor(
    @InjectRepository(SysTenantEntity)
    private readonly tenantEntityRep: Repository<SysTenantEntity>,
  ) {}

  async create(createSysTenantDto: CreateSysTenantDto) {
    const res = await this.tenantEntityRep.save(createSysTenantDto);
    return ResultData.ok(res);
  }

  async findAll(query: ListSysTenantDto) {
    const entity = this.tenantEntityRep.createQueryBuilder('entity');
    entity.where({ delFlag: '0' });
    if (query.tenantCode) {
      entity.andWhere('entity.tenantCode LIKE :tenantCode', { tenantCode: `%${query.tenantCode}%` });
    }
    if (query.tenantName) {
      entity.andWhere('entity.tenantName LIKE :tenantName', { tenantName: `%${query.tenantName}%` });
    }
    if (query.tenantContact) {
      entity.andWhere('entity.tenantContact = :tenantContact', { tenantContact: query.tenantContact });
    }
    if (query.tenantPhone) {
      entity.andWhere('entity.tenantPhone = :tenantPhone', { tenantPhone: query.tenantPhone });
    }
    if (query.status) {
      entity.andWhere('entity.status = :status', { status: query.status });
    }
    entity.select([
      'entity.tenantId',
      'entity.tenantCode',
      'entity.tenantName',
      'entity.tenantDesc',
      'entity.tenantContact',
      'entity.tenantPhone',
      'entity.tenantArea',
      'entity.tenantAddress',
      'entity.longitude',
      'entity.latitude',
      'entity.tenantLogo',
      'entity.expireTime',
      'entity.packageId',
      'entity.areaCode',
    ]);
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
    const res = await this.tenantEntityRep.findOne({
      where: {
        delFlag: '0',
        tenantId: id,
      },
    });
    return ResultData.ok(res);
  }

  async update(updateSysTenantDto: UpdateSysTenantDto) {
    const res = await this.tenantEntityRep.update({ tenantId: updateSysTenantDto.tenantId }, updateSysTenantDto);
    return ResultData.ok({ value: res.affected >= 1 });
  }

  async remove(id: number) {
    const res = await this.tenantEntityRep.update(
      { tenantId: id },
      {
        delFlag: '1',
      },
    );
    return ResultData.ok({ value: res.affected >= 1 });
  }

  async findAllTenant(query:ListAllSysTenantDto) {
    const entity = this.tenantEntityRep.createQueryBuilder('entity');
    entity.where({ delFlag: '0' });
    entity.select(['entity.tenantName','entity.tenantCode']);
    return ResultData.ok(await entity.getMany());
  }
}
