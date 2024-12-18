
import { IsString, IsNumber, IsBoolean, IsDate, IsOptional, IsEnum } from 'class-validator';
import { ApiProperty, OmitType, IntersectionType } from '@nestjs/swagger';
import { PagingDto } from 'src/common/dto/index';
import { CharEnum } from 'src/common/enum/index';


export class CreateDoctorDto{
    @ApiProperty({required: true , description: '医生姓名'})
    @IsString()
    doctorName: string;

    @ApiProperty({required: true , description: '医生头像'})
    @IsString()
    doctorAvatar: string;

    @ApiProperty({required: true , description: '医生职称'})
    @IsString()
    doctorPostId: number;

    @ApiProperty({required: true , description: '医生简介'})
    @IsString()
    doctorIntro: string;

    @ApiProperty({required: true , description: '医生擅长'})
    @IsString()
    doctorGoodAt: string;

    @ApiProperty({required: false , description: '是否推荐'})
    @IsOptional()
    @IsNumber()
    isRecommend?: number;

    @ApiProperty({required: true , description: '医院ID',default:'000000'})
    @IsString()
    tenantCode: string;
}

export class UpdateDoctorDto extends CreateDoctorDto {
    @ApiProperty({required: true , description: '医生ID'})
    @IsNumber()
    doctorId: number;
}

export class QueryDoctorDto  extends PagingDto {
    @ApiProperty({required: false , description: '医生姓名'})
    @IsOptional()
    @IsString()
    doctorName?: string;

    @ApiProperty({required: false , description: '医生职称'})
    @IsOptional()
    @IsString()
    doctorPostId?: string;

    @ApiProperty({required: false , description: '医生科室'})
    @IsOptional()
    @IsString()
    doctorDeptId?: string;

    @ApiProperty({required: false , description: '医生状态'})
    @IsOptional()
    status?: string;
}
