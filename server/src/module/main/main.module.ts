import { Module } from '@nestjs/common';
import { MainService } from './main.service';
import { MainController } from './main.controller';
import { SysTenantModule } from "../system/tenant/tenant.module";

@Module({
  imports: [SysTenantModule],
  controllers: [MainController],
  providers: [MainService],
})
export class MainModule {}
