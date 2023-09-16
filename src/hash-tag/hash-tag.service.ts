import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { HashTagModel } from './model/hash-tag.model';
import { InjectModel } from '@nestjs/sequelize';
import { UserModel } from 'src/user/model/user.model';
import { DataStatusModel } from 'src/data-status/model/data-status.model';
import { Sequelize } from 'sequelize-typescript';
import { CreateHashTagInput } from './dto/create-hash-tag.input';
import { UpdateHashTagInput } from './dto/update-hash-tag.input';

@Injectable()
export class HashTagService {
  constructor(
    @InjectModel(HashTagModel) private hashTagModel: typeof HashTagModel,
    @InjectModel(UserModel) private userModel: typeof UserModel,
    @InjectModel(DataStatusModel)
    private dataStatusModel: typeof DataStatusModel,
    private sequelize: Sequelize,
  ) {}

  public async createHashTag(
    inputs: CreateHashTagInput,
  ): Promise<HashTagModel> {
    const getUser = await this.userModel.findOne({
      where: { id: inputs.user_id },
    });
    if (!getUser) {
      throw new NotFoundException(`no user found`);
    } else {
      const getStatus = await this.dataStatusModel.findOne({
        where: { status_number: inputs.status_number },
      });
      if (!getStatus) {
        throw new NotFoundException(`no status found`);
      } else {
        const getHashTag = await this.hashTagModel.findOne({
          where: { value_info: inputs.value_info },
        });
        if (getHashTag !== null) {
          throw new ConflictException(`hash tag already exists`);
        } else {
          const hashInputs = new HashTagModel();
          hashInputs.name = inputs.name;
          hashInputs.value_info = inputs.value_info;
          hashInputs.status = inputs.status;
          hashInputs.user_id = getUser.dataValues.id;
          hashInputs.status_id = getStatus.dataValues.id;
          const hashCreate = await this.hashTagModel.create(
            hashInputs.dataValues,
          );
          return hashCreate;
        }
      }
    }
  }

  public async updateHashTag(
    id: string,
    inputs: UpdateHashTagInput,
  ): Promise<HashTagModel> {
    const getHashTag = await this.hashTagModel.findOne({
      where: { id },
    });
    if (!getHashTag) {
      throw new NotFoundException(`no hash tag found`);
    } else {
      getHashTag.name = inputs.name;
      getHashTag.value_info = inputs.value_info;
      getHashTag.status = inputs.status;
      await this.hashTagModel.update(getHashTag.dataValues, { where: { id } });
      return getHashTag;
    }
  }

  public async deleteHashTag(id: string): Promise<HashTagModel> {
    const getHashTag = await this.hashTagModel.findOne({
      where: { id },
    });
    if (!getHashTag) {
      throw new NotFoundException(`no hash tag found`);
    } else {
      await this.hashTagModel.destroy({ where: { id } });
      return getHashTag;
    }
  }

  public async getHashTag(id: string): Promise<HashTagModel> {
    const getHash = await this.hashTagModel
      .scope([
        { method: ['users'] },
        { method: ['hashtag_statuses'] },
        { method: ['hash_tag_celestial_posts'] },
        { method: ['hash_tags_events'] },
      ])
      .findOne({
        where: { id },
      });
    if (getHash === null) {
      throw new NotFoundException(`no data found`);
    } else {
      return getHash;
    }
  }

  public async getHashTags(): Promise<Array<HashTagModel>> {
    const getHashTag = await this.hashTagModel
      .scope([
        { method: ['users'] },
        { method: ['hashtag_statuses'] },
        { method: ['hash_tag_celestial_posts'] },
        { method: ['hash_tags_events'] },
      ])
      .findAll();
    return getHashTag;
  }
}
