import { IsString, IsJSON, IsEnum, IsPhoneNumber, Min, IsOptional, IsBoolean, IsNumber, MinLength, MaxLength } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export enum StatusEnum {
  STATIC = '0',
  DYNAMIC = '1',
}

export class LoginDto {

  @ApiProperty({
    required: false,
  })
  @IsOptional()
  @IsString()
  tenantCode?: string;

  @ApiProperty({
    required: false,
  })
  @IsOptional()
  @IsString()
  code?: string;

  @ApiProperty({
    required: true,
  })
  @IsString()
  @MinLength(2)
  @MaxLength(10)
  username: string;

  @ApiProperty({
    required: true,
  })
  @IsString()
  @MinLength(5)
  @MaxLength(20)
  password: string;

  @ApiProperty({
    required: true,
  })
  @IsOptional()
  @IsString()
  uuid?: string;
}

export class RegisterDto extends LoginDto {}

export class ClientInfoDto {
  ipaddr: string;
  userAgent: string;
  browser: string;
  os: string;
  loginLocation: string;
}
