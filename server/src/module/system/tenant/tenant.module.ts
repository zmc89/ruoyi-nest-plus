
import { Module } from '@nestjs/common';
import { SysTenantService } from './tenant.service';
import { SysTenantController } from './tenant.controller';
import { SysTenantEntity } from './entity/tenant.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([SysTenantEntity])],
  controllers: [SysTenantController],
  providers: [SysTenantService],
})
export class SysTenantModule {}
