import {Entity, PrimaryGeneratedColumn} from "typeorm";
import { BaseEntity } from "../../../../common/entity/base";
import {ApiProperty} from "@nestjs/swagger";

@Entity('health_information',{
    comment:'健康资讯'
})

export class HealthInformationEntity extends BaseEntity{
@ApiProperty({ type: String, description: '健康资讯id' })
@PrimaryGeneratedColumn({ type: 'int', name: 'health_information_id', comment: '健康资讯id' })
    healthInformationId: number;
@ApiProperty({ type: String, description: '标题' })
    title: string;

}
