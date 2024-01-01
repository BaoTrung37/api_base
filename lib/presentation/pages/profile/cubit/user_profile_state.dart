part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    @Default('') String username,
    @Default('') String name,
    @Default('') String avatarPath,
    @Default(false) bool includeAdult,
  }) = _UserProfileState;
}
