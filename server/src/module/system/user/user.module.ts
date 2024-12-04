import { Module, Global } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { UserEntity } from './entity/sys-user.entity';
import { SysUserWithPostEntity } from './entity/user-width-post.entity';
import { SysUserWithRoleEntity } from './entity/user-width-role.entity';
import { SysDeptEntity } from '../dept/entity/dept.entity';
import { SysRoleEntity } from '../role/entity/role.entity';
import { SysPostEntity } from '../post/entity/post.entity';

@Global()
@Module({
  imports: [
    TypeOrmModule.forFeature([UserEntity, SysDeptEntity, SysRoleEntity, SysPostEntity, SysUserWithPostEntity, SysUserWithRoleEntity]),
    JwtModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (config: ConfigService) => ({
        secret: config.get('jwt.secretkey'),
      }),
      inject: [ConfigService],
    }),
  ],
  controllers: [UserController],
  providers: [UserService],
  exports: [UserService],
})
export class UserModule {}
