
import { Controller, Get, Post, Put, Body, Query, Param, Delete } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import { SysTenantPackageService } from './package.service';
import {CreatePackageDto, UpdatePackageDto, QueryPackageDto, updatePackageStatusDto} from './dto/package.dto';

@ApiTags('租户套餐')
@Controller('system/tenant/package')
export class SysTenantPackageController {
constructor(private readonly  tenantPackageService: SysTenantPackageService) {}
    @ApiOperation({
        summary: '租户套餐-创建',
    })
    @RequirePermission('system:tenantPackage:add')
    @Post()
    create(@Body() body: CreatePackageDto) {
        return this.tenantPackageService.create(body);
    }

    @ApiOperation({
        summary: '租户套餐-列表',
    })
    @RequirePermission('system:tenantPackage:list')
    @Get('list')
    findAll(@Query() query: QueryPackageDto) {
        return this.tenantPackageService.findAll(query);
    }

    @ApiOperation({
        summary: '租户套餐-详情',
    })
    @RequirePermission('system:tenantPackage:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.tenantPackageService.findOne(+id);
    }

    @ApiOperation({
        summary: '租户套餐-修改',
    })
    @RequirePermission('system:tenantPackage:edit')
    @Put()
    update(@Body() body: UpdatePackageDto) {
        return this.tenantPackageService.update(body);
    }

    @ApiOperation({
        summary: '租户套餐-删除',
    })
    @RequirePermission('system:tenantPackage:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.tenantPackageService.remove(+id);
    }
    @ApiOperation({
        summary: '租户套餐-更改状态',
    })
    @RequirePermission('system:tenantPackage:edit')
    @Put('changePackageStatus')
    async changePackageStatus(@Body() body:updatePackageStatusDto) {
        return await this.tenantPackageService.changePackageStatus(body);
    }

}
