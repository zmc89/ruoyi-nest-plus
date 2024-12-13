
import { Controller, Get, Post, Put, Body, Query, Param, Delete,Request } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import { DepartmentsService } from './departments.service';
import { CreateDepartmentsDto,UpdateDepartmentsDto, QueryDepartmentsDto,  } from './dto/index';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';

@ApiTags('医院科室表')
@Controller('hospital/departments')
export class DepartmentsController {
    constructor(private readonly departmentsService: DepartmentsService) {}
    @ApiOperation({
        summary: '医院科室表-创建',
    })
    @RequirePermission('hospital:departments:add')
    @Post()
    create(@Request() req, @Body() body: CreateDepartmentsDto) {
       let tenantCode = req.user.tentanCode;
       body['tenantCode'] = tenantCode;
        return this.departmentsService.create(body);
    }

    @ApiOperation({
        summary: '医院科室表-列表',
    })
    @RequirePermission('hospital:departments:list')
    @Get('list')
    findAll(@Query() query: QueryDepartmentsDto) {
        return this.departmentsService.findAll(query);
    }

    @ApiOperation({
        summary: '部门管理-黑名单',
    })
    @RequirePermission('hospital:departments:list')
    @Get('/list/exclude/:id')
    findListExclude(@Param('id') id: string) {
        return this.departmentsService.findListExclude(+id);
    }

    @ApiOperation({
        summary: '医院科室表-详情',
    })
    @RequirePermission('hospital:departments:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.departmentsService.findOne(+id);
    }

    @ApiOperation({
        summary: '医院科室表-修改',
    })
    @ApiDataResponse()
    @RequirePermission('hospital:departments:edit')
    @Put()
    update(@Body() body: UpdateDepartmentsDto) {
        return this.departmentsService.update(body);
    }

    @ApiOperation({
        summary: '医院科室表-删除',
    })
    @ApiDataResponse()
    @RequirePermission('hospital:departments:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.departmentsService.remove(+id);
    }
}
