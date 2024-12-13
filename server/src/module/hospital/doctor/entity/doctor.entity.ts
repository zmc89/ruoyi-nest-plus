import {Column, Entity, PrimaryGeneratedColumn} from "typeorm";
import { BaseEntity } from 'src/common/entity/base'
import { ApiProperty } from "@nestjs/swagger";

@Entity('hospital_doctor',{
    comment:'医生表'
})
export class HospitalDoctorEntity extends BaseEntity{
    @ApiProperty({ type: String, description: '医生id' })
    @PrimaryGeneratedColumn({ type: 'int', name: 'doctor_id', comment: '医生ID' })
    doctorId: number;

    @Column({ type: 'varchar',name: 'tenant_code', comment: '医院ID'})
    tenantCode: string;

    @Column({ type: 'varchar',name: 'doctor_name', comment: '医生姓名' })
    doctorName: string;

    @Column({ type: 'varchar',name: 'doctor_phone', comment: '医生联系方式' })
    doctorPhone: string;

    @Column({ type: 'varchar',name: 'doctor_avatar', comment: '医生头像' })
    doctorAvatar: string;

    @Column({ type: 'int',name: 'doctor_post_id', comment: '医生职称' })
    doctorPostId: number;

    @Column({ type: 'int',name: 'doctor_dept_id', comment: '医生所在科室' })
    doctorDeptId: number;

    @Column({ type: 'varchar',name: 'doctor_intro', comment: '医生简介' })
    doctorIntro: string;

    @Column({ type: 'varchar',name: 'doctor_good_at', comment: '医生擅长' })
    doctorGoodAt: string;

    @Column({ type: 'int',name: 'is_recommend', comment: '是否首页推荐' })
    isRecommend: number;
}
