
import { IsString, IsNumber, IsBoolean, IsDate, IsOptional, IsEnum } from 'class-validator';
import { ApiProperty, OmitType, IntersectionType } from '@nestjs/swagger';
import { PagingDto } from 'src/common/dto/index';
import { CharEnum } from 'src/common/enum/index';


export class CreateDepartmentsDto{
    @ApiProperty({required: true , description: '科室名称'})
    @IsString()
    deptName: string;

    @ApiProperty({required: false , description: '父级科室'})
    @IsOptional()
    @IsNumber()
    parentId?: number;

    @ApiProperty({required: false , description: '所属医院'})
    @IsOptional()
    @IsString()
    tenantCode?: string;

    @ApiProperty({required: true , description: '排序'})
    @IsOptional()
    @IsNumber()
    sort: number;

    @ApiProperty({required: false , description: '科室负责人'})
    @IsOptional()
    @IsString()
    leader?: string;

    @ApiProperty({required: false , description: '负责人电话'})
    @IsOptional()
    @IsString()
    phone?: string;
}

export class UpdateDepartmentsDto extends CreateDepartmentsDto {
    @ApiProperty({required: true , description: '科室ID'})
    hospitalDeptId: number;
}

export class QueryDepartmentsDto {
    @ApiProperty({required: false , description: '科室名称'})
    deptName?: string;

    @ApiProperty({required: false , description: '状态'})
    status?: string;
}


