import {BaseEntity, Column, Entity, PrimaryColumn, PrimaryGeneratedColumn} from "typeorm";
import {ApiProperty} from "@nestjs/swagger";


@Entity('sys_tenant_package',{
    comment:'租户套餐表'
})

export class SysTenantPackageEntity extends BaseEntity {
    @ApiProperty({type: Number,description: '套餐id'})
    @PrimaryGeneratedColumn({type: 'bigint', name: 'package_id', comment: '套餐id'})
    public packageId: number;

    @Column({type: 'varchar', name: 'package_name', length: 100, comment: '套餐名称'})
    public packageName: string;

    @Column({type: 'longtext', name: 'menu_ids',comment: '关联菜单id'})
    public menuIds: string;

    @Column({type: 'tinyint', name: 'menu_check_strictly', comment: '菜单树选择项是否关联显示'})
    public menuCheckStrictly: number;

}
