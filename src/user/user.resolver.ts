import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { UserService } from './user.service';
import { CreateUserInput } from './dto/create-user.input';
import { UserModel } from './model/user.model';
import { AllowUnauthorized } from '../auth/decorators/allow-unauthorized.decorator';
import { UserAuthModel } from './model/user-auth.model';
import { UserCountModel } from './model/user-count.model';
import { UserResetPasswordModel } from './model/user-reset-password.model';
import { GqlAuthId } from '../auth/decorators/gql-auth-id.decorator';
import { GraphQLBoolean } from 'graphql';
import { UpdateUserInput } from './dto/update-user.input';
import { UserTeamModel } from './model/user-team.model';

@Resolver(() => UserModel)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @AllowUnauthorized()
  @Mutation(() => UserModel)
  createUser(@Args('createUserInput') createUserInput: CreateUserInput) {
    return this.userService.createUser(createUserInput);
  }

  @AllowUnauthorized()
  @Query(() => [UserModel])
  getUsers() {
    return this.userService.getUsers();
  }

  @AllowUnauthorized()
  @Query(() => UserModel)
  getUser(@Args('id') id: string) {
    return this.userService.getUser(id);
  }

  @AllowUnauthorized()
  @Mutation(() => UserModel)
  updateUser(
    @Args('id') id: string,
    @Args('createUserInput') createUserInput: CreateUserInput,
  ) {
    return this.userService.updateUser(id, createUserInput);
  }

  @AllowUnauthorized()
  @Mutation(() => UserModel)
  deleteUser(@Args('id') id: string) {
    return this.userService.deleteUser(id);
  }

  @AllowUnauthorized()
  @Mutation(() => UserAuthModel)
  signIn(
    @Args('email') email: string,
    @Args('password') password: string,
    @Args('role') role: string,
  ) {
    return this.userService.signIn(email, password, role);
  }

  @AllowUnauthorized()
  @Query(() => UserCountModel)
  userCount() {
    return this.userService.userCount();
  }

  @Query(() => UserModel)
  profileDetails(@GqlAuthId() id: string) {
    return this.userService.profileDetails(id);
  }

  // @AllowUnauthorized()
  @Query(() => GraphQLBoolean)
  isAuthorizedUser(@GqlAuthId() id: string) {
    return this.userService.isAuthorizedUser(id);
  }

  @AllowUnauthorized()
  @Mutation(() => UserResetPasswordModel)
  resetPassword(
    @Args('email') email: string,
    @Args('password') password: string,
  ) {
    return this.userService.resetPassword(email, password);
  }

  @Mutation(() => UserModel)
  updateProfile(
    @GqlAuthId() userId: string,
    @Args('updateUserInput') updateUserInput: UpdateUserInput,
  ) {
    return this.userService.updateProfile(userId, updateUserInput);
  }

  @AllowUnauthorized()
  @Mutation(() => UserModel)
  createEventPlannerTeamMember(
    @Args('email') email: string,
    @Args('createUserInput') createUserInput: CreateUserInput,
  ) {
    return this.userService.createEventPlannerTeamMember(
      email,
      createUserInput,
    );
  }
}
