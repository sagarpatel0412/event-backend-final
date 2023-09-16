import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserResolver } from './user.resolver';
import { SequelizeModule } from '@nestjs/sequelize';
import { UserModel } from './model/user.model';
import { AuthModule } from 'src/auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { UserRolesModel } from 'src/user-roles/model/user-roles.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { UserTeamModel } from './model/user-team.model';

@Module({
  imports: [
    ConfigModule.forRoot({ expandVariables: true }),
    SequelizeModule.forFeature([
      UserModel,
      UserRolesModel,
      DataStatusModel,
      UserTeamModel,
    ]),
    AuthModule,
  ],
  providers: [UserResolver, UserService],
  exports: [UserService],
})
export class UserModule {}
