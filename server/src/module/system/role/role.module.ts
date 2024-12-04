import { Global, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RoleService } from './role.service';
import { RoleController } from './role.controller';
import { SysRoleEntity } from './entity/role.entity';
import { SysRoleWithMenuEntity } from './entity/role-width-menu.entity';
import { SysRoleWithDeptEntity } from './entity/role-width-dept.entity';
import { SysDeptEntity } from '../dept/entity/dept.entity';

@Global()
@Module({
  imports: [TypeOrmModule.forFeature([SysRoleEntity, SysRoleWithMenuEntity, SysRoleWithDeptEntity, SysDeptEntity])],
  controllers: [RoleController],
  providers: [RoleService],
  exports: [RoleService],
})
export class RoleModule {}
