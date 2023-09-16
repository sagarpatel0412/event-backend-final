import { Module } from '@nestjs/common';
import { HashTagService } from './hash-tag.service';
import { HashTagResolver } from './hash-tag.resolver';
import { SequelizeModule } from '@nestjs/sequelize';
import { HashTagModel } from './model/hash-tag.model';
import { UserModel } from 'src/user/model/user.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';

@Module({
  imports: [
    SequelizeModule.forFeature([HashTagModel, UserModel, DataStatusModel]),
  ],
  providers: [HashTagResolver, HashTagService],
})
export class HashTagModule {}
