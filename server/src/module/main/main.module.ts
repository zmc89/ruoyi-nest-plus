import { Module } from '@nestjs/common';
import { MainService } from './main.service';
import { MainController } from './main.controller';
import { SysTenantModule } from "../system/tenant/tenant/tenant.module";
import { SysTenantEntity } from "../system/tenant/tenant/entity/tenant.entity";
import { TypeOrmModule } from "@nestjs/typeorm";

@Module({
  imports: [SysTenantModule,TypeOrmModule.forFeature([SysTenantEntity])],
  controllers: [MainController],
  providers: [MainService],
})
export class MainModule {}
