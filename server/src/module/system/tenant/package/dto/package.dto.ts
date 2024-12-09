
import { IsString, IsNumber,IsOptional } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { PagingDto } from 'src/common/dto/index';


export class CreatePackageDto {
	@ApiProperty({required: false , description: '套餐名称'})
	@IsOptional()
	@IsString()
	packageName?: string;

	@ApiProperty({required: false , description: '关联菜单id'})
	@IsOptional()
	@IsString()
	menuIds?: string;

	@ApiProperty({required: false , description: '菜单树选择项是否关联显示'})
	@IsOptional()
	@IsNumber()
	menuCheckStrictly?: number;
}

export class UpdatePackageDto extends CreatePackageDto {
	@ApiProperty({required: false , description: '套餐id'})
	@IsOptional()
	@IsNumber()
	packageId?: number;
}

export class QueryPackageDto extends PagingDto {
	@ApiProperty({required: false , description: '套餐名称'})
	@IsOptional()
	@IsString()
	packageName?: string;
}

export class updatePackageStatusDto {
	@ApiProperty({required: true , description: '套餐id'})
	@IsNumber()
	packageId: number;

	@ApiProperty({required: true , description: '状态'})
	@IsString()
	status: string;
}

