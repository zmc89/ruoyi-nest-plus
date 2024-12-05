
import {IsString, IsNumber, IsDate, IsOptional, Length, IsEnum} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { PagingDto } from 'src/common/dto/index';

export enum StatusEnum {
	STATIC = '0',
	DYNAMIC = '1',
}

export class CreateSysTenantDto {
	@ApiProperty({required: true , description: '租户名称'})
	@IsString()
	tenantName: string;

	@ApiProperty({required: true , description: '用户名'})
	@IsString()
	userName: string;

	@ApiProperty({required: true , description: '密码'})
	@IsString()
	password: string;

	@ApiProperty({required: false , description: '租户描述'})
	@IsOptional()
	@IsString()
	tenantDesc?: string;

	@ApiProperty({required: false , description: '租户联系人'})
	@IsOptional()
	@IsString()
	tenantContact?: string;

	@ApiProperty({required: false , description: '租户联系电话'})
	@IsOptional()
	@IsString()
	tenantPhone?: string;

	@ApiProperty({required: true , description: '租户地区'})
	@IsString()
	tenantArea: string;

	@ApiProperty({required: true , description: '租户联系地址'})
	@IsString()
	tenantAddress?: string;

	@ApiProperty({required: true , description: '经度'})
	@IsNumber()
	longitude?: number;

	@ApiProperty({required: true , description: '纬度'})
	@IsNumber()
	latitude?: number;

	@ApiProperty({required: true , description: '租户logo'})
	@IsString()
	tenantLogo?: string;

	@ApiProperty({required: true , description: '过期时间'})
	@IsDate()
	@IsString()
	expireTime: Date;

	@ApiProperty({required: true , description: '租户套餐id'})
	@IsNumber()
	packageId: number;

	@ApiProperty({required: true , description: '租户地区编码'})
	@IsString()
	areaCode: string;
}

export class ListSysTenantDto extends PagingDto {
	@ApiProperty({required: false , description: '租户编码'})
	@IsOptional()
	@IsNumber()
	tenantCode?: number;


	@ApiProperty({required: false , description: '租户名称'})
	@IsOptional()
	@IsString()
	@Length(0, 50)
	tenantName?: string;

	@ApiProperty({required: false , description: '租户状态'})
	@IsOptional()
	@IsString()
	@IsEnum(StatusEnum)
	status?: string;

	@ApiProperty({required: false , description: '联系人'})
	@IsOptional()
	@IsString()
	@Length(0, 50)
	tenantContact?: string;

	@ApiProperty({required: false , description: '联系电话'})
	@IsOptional()
	@IsString()
	@Length(0, 50)
	tenantPhone?: string;
}

export class AllListSysTenantDto {
	@ApiProperty({required: false , description: '租户名称'})
	@IsOptional()
	@IsString()
	tenantName?: string;
}

export class UpdateSysTenantDto extends CreateSysTenantDto {
	@ApiProperty({required: true , description: '租户id'})
	@IsNumber()
	tenantId: number;
}

