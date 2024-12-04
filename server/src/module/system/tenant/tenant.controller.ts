
import {Controller, Post, Body, Get, Param, Query, Put, Delete} from '@nestjs/common';
import {ApiTags, ApiOperation, ApiBody} from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import {SysTenantService } from './tenant.service';
import {CreateSysTenantDto, ListSysTenantDto, UpdateSysTenantDto} from './dto/tenant.dto';


@ApiTags('租户表')
@Controller('system/tenant')
export class SysTenantController {
constructor(private readonly sysTenantService: SysTenantService) {}
    @ApiOperation({
        summary: '租户表-创建',
    })
   @ApiBody({
       type: CreateSysTenantDto,
       required: true,
   })
    @RequirePermission('system:tenant:add')
    @Post()
    create(@Body() body: CreateSysTenantDto) {
        return this.sysTenantService.create(body);
    }


    @ApiOperation({
        summary: '租户表-列表',
    })
    @RequirePermission('system:tenant:list')
    @Get('list')
    findAll(@Query() query: ListSysTenantDto) {
        return this.sysTenantService.findAll(query);
    }

    @ApiOperation({
        summary: '租户表-详情',
    })
    @RequirePermission('system:tenant:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.sysTenantService.findOne(+id);
    }

    @ApiOperation({
        summary: '租户表-修改',
    })
    @RequirePermission('system:tenant:edit')
    @Put()
    update(@Body() body: UpdateSysTenantDto) {
        return this.sysTenantService.update(body);
    }

    @ApiOperation({
        summary: '租户表-删除',
    })
    @RequirePermission('system:tenant:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.sysTenantService.remove(+id);
    }
}
