import { Module } from "@nestjs/common";
import { DoctorService } from "./doctor.service";
import { DoctorController } from "./doctor.controller";
import { TypeOrmModule } from '@nestjs/typeorm';
import { HospitalDoctorEntity } from "./entity/doctor.entity";

@Module({
  imports: [TypeOrmModule.forFeature([HospitalDoctorEntity])],
  controllers: [DoctorController],
  providers: [DoctorService],
})

export class DoctorModule {}
