
import { IsString, IsNumber,IsOptional } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { PagingDto } from 'src/common/dto/index';
import {BaseEntity} from "src/common/entity/base";


export class CreateStateDto extends BaseEntity {
    @ApiProperty({required: false , description: '健康状态辩证id'})
    @IsOptional()
    @IsNumber()
    healthStateId?: number;

    @ApiProperty({required: false , description: '健康状态标签'})
    @IsOptional()
    @IsString()
    healthStateTag?: string;

    @ApiProperty({required: false , description: '健康状态内容'})
    @IsOptional()
    @IsString()
    healthStateContent?: string;

    @ApiProperty({required: false , description: '健康状态描述'})
    @IsOptional()
    @IsString()
    healthStateDesc?: string;

    @ApiProperty({required: false , description: '健康状态图片'})
    @IsOptional()
    @IsString()
    healthStateImg?: string;

    @ApiProperty({required: false , description: '所属医院'})
    @IsOptional()
    @IsString()
    tenantCode?: string;

    @ApiProperty({required: false , description: '关联用户id'})
    @IsOptional()
    @IsNumber()
    userId?: number;

}



export class UpdateStateDto extends CreateStateDto {
    @ApiProperty({required: false , description: '健康状态id'})
    @IsOptional()
    @IsNumber()
    healthStateId?: number;
}

export class QueryStateDto extends PagingDto {
    @ApiProperty({required: false , description: '用户名称'})
    @IsOptional()
    @IsString()
    userName?: string;
}

