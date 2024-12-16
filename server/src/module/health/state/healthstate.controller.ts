
import { Controller, Get, Post, Put, Body, Query, Param, Delete } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import { HealthStateService } from './healthstate.service';
import { CreateStateDto, UpdateStateDto, QueryStateDto } from './dto/index';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';

@ApiTags('健康状态辩证表')
@Controller('health/state')
export class HealthStateController {
    constructor(private readonly stateService: HealthStateService) {}
    @ApiOperation({
        summary: '健康状态辩证表-创建',
    })
    @RequirePermission('health:state:add')
    @Post()
    create(@Body() body: CreateStateDto) {
        return this.stateService.create(body);
    }

    @ApiOperation({
        summary: '健康状态辩证表-列表',
    })
    @RequirePermission('health:state:list')
    @Get('list')
    findAll(@Query() query: QueryStateDto) {
        return this.stateService.findAll(query);
    }

    @ApiOperation({
        summary: '健康状态辩证表-详情',
    })
    @RequirePermission('health:state:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.stateService.findOne(+id);
    }

    @ApiOperation({
        summary: '健康状态辩证表-修改',
    })
    @ApiDataResponse()
    @RequirePermission('health:state:edit')
    @Put()
    update(@Body() body: UpdateStateDto) {
        return this.stateService.update(body);
    }

    @ApiOperation({
        summary: '健康状态辩证表-删除',
    })
    @ApiDataResponse()
    @RequirePermission('health:state:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.stateService.remove(+id);
    }
}
