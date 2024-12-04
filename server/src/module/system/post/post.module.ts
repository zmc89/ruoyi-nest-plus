import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PostService } from './post.service';
import { PostController } from './post.controller';
import { SysPostEntity } from './entity/post.entity';
@Module({
  imports: [TypeOrmModule.forFeature([SysPostEntity])],
  controllers: [PostController],
  providers: [PostService],
})
export class PostModule {}
