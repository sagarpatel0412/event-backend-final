import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Sequelize } from 'sequelize-typescript';
import { CreateUserRoleInput } from './dto/create-user-role.input';
import { UpdateUserRoleInput } from './dto/update-user-role.input';
import { UserRoleCountModel } from './model/user-role-count.model';
import { UserRolesModel } from './model/user-roles.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';

@Injectable()
export class UserRolesService {
  constructor(
    @InjectModel(UserRolesModel) private userRolesModel: typeof UserRolesModel,
    @InjectModel(DataStatusModel)
    private dataStatusModel: typeof DataStatusModel,
    private sequelize: Sequelize,
  ) {}

  public async createUserRoles(
    roles: CreateUserRoleInput,
  ): Promise<UserRolesModel> {
    const getStatus = await this.dataStatusModel.findOne({
      where: { status_number: roles.status_number },
    });
    if (!getStatus) {
      throw new NotFoundException(`${roles.status_number} doesnt exists`);
    } else {
      const roleInput = new UserRolesModel();
      roleInput.name = roles.name;
      roleInput.status = roles.status;
      roleInput.description = roles.description;
      roleInput.value_info = roles.value_info;
      roleInput.status_id = getStatus.dataValues.id;

      const rolesInput = await this.userRolesModel.create(roleInput.dataValues);
      return rolesInput;
    }
  }

  public async updateUserRoles(
    id: string,
    roles: UpdateUserRoleInput,
  ): Promise<UserRolesModel> {
    const roleInput = await this.userRolesModel.findOne({ where: { id } });
    if (!roleInput) {
      throw new NotFoundException(`${id} not found`);
    } else {
      roleInput.name = roles.name;
      roleInput.status = roles.status;
      roleInput.description = roles.description;
      roleInput.value_info = roles.value_info;

      await this.userRolesModel.update(roleInput.dataValues, { where: { id } });
      return roleInput;
    }
  }

  public async deleteUserRoles(id: string): Promise<UserRolesModel> {
    const roleInput = await this.userRolesModel.findOne({ where: { id } });
    if (!roleInput) {
      throw new NotFoundException(`${id} not found`);
    } else {
      await this.userRolesModel.destroy({ where: { id } });
      return roleInput;
    }
  }

  public async getUserRole(id: string): Promise<UserRolesModel> {
    const roleInput = await this.userRolesModel
      .scope([{ method: ['users'] }, { method: ['user_roles_status'] }])
      .findOne({ where: { id } });
    return roleInput;
  }

  public async getUserRoles(): Promise<Array<UserRolesModel>> {
    const roleInput = await this.userRolesModel
      .scope([{ method: ['users'] }, { method: ['user_roles_status'] }])
      .findAll();
    return roleInput;
  }

  public async countUserRoles(): Promise<UserRoleCountModel> {
    const roleCount = await this.userRolesModel.count();
    const count = new UserRoleCountModel();
    count.count = roleCount;
    return count;
  }
}
