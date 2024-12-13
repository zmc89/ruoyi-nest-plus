
import { Controller, Get, Post, Put, Body, Query, Param, Delete } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import { DoctorService } from './doctor.service';
import { CreateDoctorDto, BaseDoctorDto, UpdateDoctorDto, QueryDoctorDto, ListDoctorDto } from './dto/doctor.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';

@ApiTags('医生表')
@Controller('system/doctor')
export class DoctorController {
    constructor(private readonly doctorService: DoctorService) {}
    @ApiOperation({
        summary: '医生表-创建',
    })
    @ApiDataResponse(BaseDoctorDto)
    @RequirePermission('system:doctor:add')
    @Post()
    create(@Body() body: CreateDoctorDto) {
        return this.doctorService.create(body);
    }

    @ApiOperation({
        summary: '医生表-列表',
    })
    @ApiDataResponse(ListDoctorDto, true, true)
    @RequirePermission('system:doctor:list')
    @Get('list')
    findAll(@Query() query: QueryDoctorDto) {
        return this.doctorService.findAll(query);
    }

    @ApiOperation({
        summary: '医生表-详情',
    })
    @ApiDataResponse(BaseDoctorDto)
    @RequirePermission('system:doctor:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.doctorService.findOne(+id);
    }

    @ApiOperation({
        summary: '医生表-修改',
    })
    @ApiDataResponse()
    @RequirePermission('system:doctor:edit')
    @Put()
    update(@Body() body: UpdateDoctorDto) {
        return this.doctorService.update(body);
    }

    @ApiOperation({
        summary: '医生表-删除',
    })
    @ApiDataResponse()
    @RequirePermission('system:doctor:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.doctorService.remove(+id);
    }
}
