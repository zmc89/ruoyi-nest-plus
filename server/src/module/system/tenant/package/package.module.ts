
import { Module } from '@nestjs/common';
import { SysTenantPackageService } from './package.service';
import { SysTenantPackageController } from './package.controller';
import { SysTenantPackageEntity } from './entity/tenant.package.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([SysTenantPackageEntity])],
  controllers: [ SysTenantPackageController],
  providers: [ SysTenantPackageService],
})
export class SysTenantPackageModule {}
