
import { InjectRepository } from '@nestjs/typeorm';
import { Repository ,Not ,In,Like} from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { CreateDoctorDto, UpdateDoctorDto, QueryDoctorDto } from './dto/index';
import { HospitalDoctorEntity } from './entity/doctor.entity';

@Injectable()
export class DoctorService {
    constructor(
        @InjectRepository(HospitalDoctorEntity)
        private readonly doctorEntityRep: Repository<HospitalDoctorEntity>,
    ) {}
    async create(createDoctorDto: CreateDoctorDto) {
        const res = await this.doctorEntityRep.save(createDoctorDto);
        return ResultData.ok(res);
    }

    async findAll(query :QueryDoctorDto ) {
        const entity = this.doctorEntityRep.createQueryBuilder('entity');
        entity.where({ delFlag: '0'});
        if(query.status){
            entity.andWhere("entity.status = :status", {status: query.status});
        }
        if(query.doctorName){
            entity.andWhere("entity.doctorName LIKE :doctorName", {doctorName: `%${query.doctorName}%`});
        }
        if(query.doctorPostId){
            entity.andWhere("entity.doctorPostId = :doctorPostId", {doctorPostId: query.doctorPostId});
        }
        if(query.doctorDeptId){
            entity.andWhere("entity.doctorDeptId = :doctorDeptId", {doctorDeptId: query.doctorDeptId});
        }
        entity.select(["entity.doctorId","entity.status","entity.remark","entity.doctorName","entity.doctorAvatar","entity.doctorIntro","entity.doctorGoodAt","entity.isRecommend","entity.tenantCode"])
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
