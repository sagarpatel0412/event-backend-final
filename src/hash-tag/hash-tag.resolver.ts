import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { HashTagService } from './hash-tag.service';
import { CreateHashTagInput } from './dto/create-hash-tag.input';
import { UpdateHashTagInput } from './dto/update-hash-tag.input';
import { HashTagModel } from './model/hash-tag.model';
import { AllowUnauthorized } from 'src/auth/decorators/allow-unauthorized.decorator';

@Resolver(() => HashTagModel)
export class HashTagResolver {
  constructor(private readonly hashTagService: HashTagService) {}

  @AllowUnauthorized()
  @Mutation(() => HashTagModel)
  createHashTag(
    @Args('createHashTagInput') createHashTagInput: CreateHashTagInput,
  ) {
    return this.hashTagService.createHashTag(createHashTagInput);
  }

  @AllowUnauthorized()
  @Query(() => [HashTagModel])
  getHashTags() {
    return this.hashTagService.getHashTags();
  }

  @AllowUnauthorized()
  @Query(() => HashTagModel)
  getHashTag(@Args('id') id: string) {
    return this.hashTagService.getHashTag(id);
  }

  @AllowUnauthorized()
  @Mutation(() => HashTagModel)
  updateHashTag(
    @Args('id') id: string,
    @Args('updateHashTagInput') updateHashTagInput: UpdateHashTagInput,
  ) {
    return this.hashTagService.updateHashTag(id, updateHashTagInput);
  }

  @AllowUnauthorized()
  @Mutation(() => HashTagModel)
  deleteHashTag(@Args('id') id: string) {
    return this.hashTagService.deleteHashTag(id);
  }
}
