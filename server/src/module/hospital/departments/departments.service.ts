
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { ResultData } from 'src/common/utils/result';
import { CreateDepartmentsDto, UpdateDepartmentsDto, QueryDepartmentsDto } from './dto/index';
import { HospitalDepartmentsEntity } from './entity/departments.entity';
import { ListToTree } from 'src/common/utils/index';

@Injectable()
export class DepartmentsService {
    constructor(
        @InjectRepository(HospitalDepartmentsEntity)
        private readonly departmentsEntityRep: Repository<HospitalDepartmentsEntity>,
    ) {}
    async create(createDepartmentsDto: CreateDepartmentsDto) {
        if(createDepartmentsDto.parentId){
            const parent = await this.departmentsEntityRep.findOne({
                where: {
                    hospitalDeptId: createDepartmentsDto.parentId,
                    delFlag: '0',
                },
                select: ['ancestors'],
            })
            if (!parent) {
                return ResultData.fail(500, '父级部门不存在');
            }
            const ancestors = parent.ancestors ? `${parent.ancestors},${createDepartmentsDto.parentId}` : `${createDepartmentsDto.parentId}`;
Object.assign(createDepartmentsDto, { ancestors: ancestors });
        }
        await this.departmentsEntityRep.save(createDepartmentsDto);
        return ResultData.ok();
    }

    async findAll(query :QueryDepartmentsDto ) {
        const entity = this.departmentsEntityRep.createQueryBuilder('entity');
        entity.where({ delFlag: '0'});
        if(query.deptName){
            entity.andWhere("entity.deptName LIKE :deptName", {deptName: `%${query.deptName}%`});
        }
        if(query.status){
            entity.andWhere("entity.status = :status", {status: query.status});
        }
        const res = await entity.getMany();
        return ResultData.ok(res);
    }

    async findOne(id: number) {
        const res = await this.departmentsEntityRep.findOne({
            where: {
                delFlag: '0',
                hospitalDeptId: id,
            },
        });
        return ResultData.ok(res);
    }

    async findListExclude(id: number) {
        //TODO 需排出ancestors 中不出现id的数据
        const data = await this.departmentsEntityRep.find({
            where: {
                delFlag: '0',
            },
        });
        return ResultData.ok(data);
    }

    async update(updateDepartmentsDto: UpdateDepartmentsDto) {
        const res = await this.departmentsEntityRep.update({  hospitalDeptId: updateDepartmentsDto.hospitalDeptId }, updateDepartmentsDto);
        return ResultData.ok({value:res.affected >= 1});
    }

    async remove(id: number) {
        const res = await this.departmentsEntityRep.update(
            { hospitalDeptId: id },
            {
                delFlag: '1',
            },
        );
        return ResultData.ok({value:res.affected >= 1});
    }

    /**
     * 部门树
     * @returns
     */
    async departmentsTree() {
        const res = await this.departmentsEntityRep.find({
            where: {
                delFlag: '0',
            },
        });
        const tree = ListToTree(
            res,
            (m) => m.hospitalDeptId,
            (m) => m.deptName,
        );
        return tree;
    }
}
