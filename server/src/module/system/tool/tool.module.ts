import { Module } from '@nestjs/common';
import { ToolService } from './tool.service';
import { ToolController } from './tool.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GenTableEntity } from './entity/gen-table.entity';
import { GenTableColumnEntity } from './entity/gen-table-cloumn.entity';

@Module({
  imports: [TypeOrmModule.forFeature([GenTableEntity, GenTableColumnEntity])],
  controllers: [ToolController],
  providers: [ToolService],
})
export class ToolModule {}
