import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { BaseEntity } from '../../../../common/entity/base';
import { ApiProperty } from '@nestjs/swagger';

@Entity('hospital_departments', {
  comment: '医院科室表',
})
export class HospitalDepartmentsEntity extends BaseEntity {
  @ApiProperty({ type: String, description: '科室id' })
  @PrimaryGeneratedColumn({ type: 'int', name: 'hospital_dept_id', comment: '科室id' })
  hospitalDeptId: number;

  @Column({ type: 'varchar', name: 'dept_name',length: 50, comment: '科室名称'})
  deptName: string;

  @Column({ type: 'int', name: 'sort', comment: '排序'})
  sort: number;

  @Column({ type: 'varchar', name: 'ancestors', length: 50, default: '0', comment: '祖级列表' })
  ancestors: string;

  @Column({ type: 'int', name: 'parent_id',default: 0,comment: '父级科室'})
  parentId: number;

  @Column({ type: 'varchar', name: 'tenant_code',default: '000000', comment: '所属医院'})
  tenantCode: string;

  @Column({ type: 'varchar', name: 'leader',nullable: true, length: 50,comment: '科室负责人'})
  leader: string;

  @Column({ type: 'varchar', name: 'phone',nullable: true, length: 11, comment: '科室负责人电话'})
  phone: string;
}
