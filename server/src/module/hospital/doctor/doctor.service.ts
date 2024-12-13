
import { InjectRepository } from '@nestjs/typeorm';
import { Repository ,Not ,In,Like} from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { CreateDoctorDto, UpdateDoctorDto, QueryDoctorDto } from './dto/doctor.dto';
import { DoctorEntity } from './entities/doctor.entity';

@Injectable()
export class DoctorService {
    constructor(
        @InjectRepository(DoctorEntity)
        private readonly doctorEntityRep: Repository<DoctorEntity>,
    ) {}
    async create(createDoctorDto: CreateDoctorDto) {
        const res = await this.doctorEntityRep.save(createDoctorDto);
        return ResultData.ok(res);
    }

    async findAll(query :QueryDoctorDto ) {
        const entity = this.doctorEntityRep.createQueryBuilder('entity');
        entity.where({ delFlag: '0'});
        if(query.doctorId){
            entity.andWhere("entity.doctorId = :doctorId", {doctorId: query.doctorId});
        }
        if(query.status){
            entity.andWhere("entity.status = :status", {status: query.status});
        }
        if(query.delFlag){
            entity.andWhere("entity.delFlag = :delFlag", {delFlag: query.delFlag});
        }
        if(query.createBy){
            entity.andWhere("entity.createBy = :createBy", {createBy: query.createBy});
        }
        if(query.createTime){
            entity.andWhere("entity.createTime BETWEEN :start AND :end", { start: query.params.beginTime, end: query.params.endTime });
        }
        if(query.updateBy){
            entity.andWhere("entity.updateBy = :updateBy", {updateBy: query.updateBy});
        }
        if(query.updateTime){
            entity.andWhere("entity.updateTime BETWEEN :start AND :end", { start: query.params.beginTime, end: query.params.endTime });
        }
        if(query.remark){
            entity.andWhere("entity.remark = :remark", {remark: query.remark});
        }
        if(query.doctorName){
            entity.andWhere("entity.doctorName LIKE :doctorName", {doctorName: `%${query.doctorName}%`});
        }
        if(query.doctorAvatar){
            entity.andWhere("entity.doctorAvatar = :doctorAvatar", {doctorAvatar: query.doctorAvatar});
        }
        if(query.doctorTitle){
            entity.andWhere("entity.doctorTitle = :doctorTitle", {doctorTitle: query.doctorTitle});
        }
        if(query.doctorIntro){
            entity.andWhere("entity.doctorIntro = :doctorIntro", {doctorIntro: query.doctorIntro});
        }
        if(query.doctorGoodAt){
            entity.andWhere("entity.doctorGoodAt = :doctorGoodAt", {doctorGoodAt: query.doctorGoodAt});
        }
        if(query.isRecommend){
            entity.andWhere("entity.isRecommend = :isRecommend", {isRecommend: query.isRecommend});
        }
        if(query.tenantCode){
            entity.andWhere("entity.tenantCode = :tenantCode", {tenantCode: query.tenantCode});
        }
        entity.select(["entity.doctorId","entity.status","entity.remark","entity.doctorName","entity.doctorAvatar","entity.doctorTitle","entity.doctorIntro","entity.doctorGoodAt","entity.isRecommend","entity.tenantCode"])
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
        const res = await this.doctorEntityRep.findOne({
            where: {
                delFlag: '0',
                doctorId: id,
            },
        });
        return ResultData.ok(res);
    }

    async update(updateDoctorDto: UpdateDoctorDto) {
        const res = await this.doctorEntityRep.update({  doctorId: updateDoctorDto.doctorId }, updateDoctorDto);
        return ResultData.ok({value:res.affected >= 1});
    }

    async remove(id: number) {
        const res = await this.doctorEntityRep.update(
            { doctorId: id },
            {
                delFlag: '1',
            },
        );
        return ResultData.ok({value:res.affected >= 1});
    }
}
