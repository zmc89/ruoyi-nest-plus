import { Module, Global } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MenuService } from './menu.service';
import { MenuController } from './menu.controller';
import { SysMenuEntity } from './entity/menu.entity';
import { SysRoleWithMenuEntity } from '../role/entity/role-width-menu.entity';
import { SysTenantPackageEntity } from "../tenant/package/entity/tenant.package.entity";

@Global()
@Module({
  imports: [TypeOrmModule.forFeature([SysMenuEntity, SysRoleWithMenuEntity,SysTenantPackageEntity])],
  controllers: [MenuController],
  providers: [MenuService],
  exports: [MenuService],
})
export class MenuModule {}
