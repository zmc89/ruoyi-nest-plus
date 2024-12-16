import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import { BaseEntity } from 'src/common/entity/base'
import { ApiProperty } from "@nestjs/swagger";

@Entity('health_state',{
  comment: '健康状态辩证表'
})

export class HealthStateEntity extends BaseEntity {
  @ApiProperty({ type: String, description: '健康状态辩证id' })
  @PrimaryGeneratedColumn({ type: 'int', name: 'health_state_id', comment: '健康状态辩证id' })
  healthStateId: number;

  @Column({type:'varchar',name:'health_state_tag',comment:'健康状态标签'})
  healthStateTag: string;

  @Column({type:'longtext',name:'health_state_content',comment:'健康状态内容'})
  healthStateContent: string;

  @Column({type:'longtext',name:'health_state_img',comment:'健康状态图片'})
  healthStateImg: string;

 @Column({type:'varchar',name:'tenant_code',comment:'所属医院',default:'000000'})
 tenantCode: string;

 @Column({type:'int',name:'user_id',comment:'关联用户id'})
  userId: number;
}
