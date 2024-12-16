
import { Module } from '@nestjs/common';
import { HealthStateService } from './healthstate.service';
import { HealthStateController } from './healthstate.controller';
import { HealthStateEntity } from './entity/state.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
    imports: [TypeOrmModule.forFeature([HealthStateEntity])],
    controllers: [HealthStateController],
    providers: [HealthStateService],
})
export class HealthStateModule {}

