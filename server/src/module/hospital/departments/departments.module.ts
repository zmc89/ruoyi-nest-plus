
import { Module } from '@nestjs/common';
import { DepartmentsService } from './departments.service';
import { DepartmentsController } from './departments.controller';
import { HospitalDepartmentsEntity } from './entity/departments.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
    imports: [TypeOrmModule.forFeature([HospitalDepartmentsEntity])],
    controllers: [DepartmentsController],
    providers: [DepartmentsService],
})
export class DepartmentsModule {}
