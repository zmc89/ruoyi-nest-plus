import { Column, Entity, PrimaryGeneratedColumn} from "typeorm";
import {ApiProperty} from "@nestjs/swagger";
import { BaseEntity } from 'src/common/entity/base';


@Entity('sys_tenant',{
    comment:"租户表"
})

export class SysTenantEntity extends BaseEntity {
    @ApiProperty({ type: Number, description: '租户id'})
    @PrimaryGeneratedColumn({ type: 'bigint', name: 'tenant_id', comment: '租户id'})
    public tenantId: number;

    @Column({ type: 'varchar', name: 'tenant_code', unique: true, comment: '租户编码', length: 50 })
    public tenantCode: string;

    @Column({ type: 'varchar', name: 'tenant_name', unique: true, comment: '租户名称', length: 100 })
    public tenantName: string;

    @Column({ type: 'longtext', name: 'tenant_desc', comment: '租户描述' })
    public tenantDesc: string;

    @Column({ type: 'varchar', name: 'tenant_contact', comment: '租户联系人', length: 50 })
    public tenantContact: string;

    @Column({ type: 'varchar', name: 'tenant_phone', comment: '租户联系电话', length: 50 })
    public tenantPhone: string;

    @Column({ type: 'varchar', name: 'tenant_area', comment: '租户地区', length: 50 })
    public tenantArea: string;

    @Column({ type: 'varchar', name: 'tenant_address', comment: '租户联系地址', length: 100 })
    public tenantAddress: string;

    @Column({ type:'int', name: 'longitude', comment: '经度'})
    public longitude: number;

    @Column({ type:'int', name: 'latitude', comment: '纬度'})
    public latitude: number;

    @Column({ type:'varchar', name: 'tenant_logo', comment: '租户logo'})
    public tenantLogo: string;

    @Column({ type:'datetime', name: 'expire_time', comment: '过期时间'})
    public expireTime: Date;

    @Column({ type:'bigint', name: 'package_id', comment: '租户套餐id'})
    public packageId: number;

    @Column({ type:'varchar', name: 'area_code', comment: '租户地区编码'})
    public areaCode: string;

}
