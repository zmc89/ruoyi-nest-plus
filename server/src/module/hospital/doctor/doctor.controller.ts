
import { Controller, Get, Post, Put, Body, Query, Param, Delete } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { RequirePermission } from 'src/common/decorators/require-premission.decorator';
import { DoctorService } from './doctor.service';
import { CreateDoctorDto, UpdateDoctorDto, QueryDoctorDto } from './dto/index';

@ApiTags('医生表')
@Controller('hospital/doctor')
export class DoctorController {
    constructor(private readonly doctorService: DoctorService) {}
    @ApiOperation({
        summary: '医生表-创建',
    })
    @RequirePermission('hospital:doctor:add')
    @Post()
    create(@Body() body: CreateDoctorDto) {
        return this.doctorService.create(body);
    }

    @ApiOperation({
        summary: '医生表-列表',
    })
    @RequirePermission('hospital:doctor:list')
    @Get('list')
    findAll(@Query() query: QueryDoctorDto) {
        return this.doctorService.findAll(query);
    }

    @ApiOperation({
        summary: '医生表-详情',
    })
    @RequirePermission('hospital:doctor:query')
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.doctorService.findOne(+id);
    }

    @ApiOperation({
        summary: '医生表-修改',
    })
    @RequirePermission('hospital:doctor:edit')
    @Put()
    update(@Body() body: UpdateDoctorDto) {
        return this.doctorService.update(body);
    }

    @ApiOperation({
        summary: '医生表-删除',
    })
    @RequirePermission('hospital:doctor:remove')
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.doctorService.remove(+id);
    }
}
