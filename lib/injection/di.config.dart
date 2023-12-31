// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../data/iml_repositories/authentication/authentication.dart' as _i14;
import '../data/iml_repositories/authentication/authentication_repository_iml.dart'
    as _i12;
import '../data/iml_repositories/iml_repositories.dart' as _i16;
import '../data/services/network_services/client/auth_api_client.dart' as _i11;
import '../data/services/network_services/client/rest_client.dart' as _i6;
import '../data/services/network_services/commons/dio_helper.dart' as _i24;
import '../data/services/network_services/interceptors/auth_interceptor.dart'
    as _i3;
import '../data/services/network_services/interceptors/token_refresh_interceptor.dart'
    as _i9;
import '../data/services/preference_services/injection_module.dart' as _i25;
import '../data/services/preference_services/shared_preference_manager.dart'
    as _i8;
import '../data/services/services.dart' as _i23;
import '../domain/use_cases/authentication/get_guest_session_use_case.dart'
    as _i13;
import '../domain/use_cases/authentication/get_request_token_use_case.dart'
    as _i15;
import '../domain/use_cases/authentication/post_create_access_token_use_case.dart'
    as _i17;
import '../domain/use_cases/authentication/post_create_request_token_use_case.dart'
    as _i18;
import '../domain/use_cases/authentication/post_create_session_use_case.dart'
    as _i19;
import '../domain/use_cases/authentication/post_login_with_username_and_password_use_case.dart'
    as _i20;
import '../domain/use_cases/use_cases.dart' as _i22;
import '../presentation/pages/main_app/cubit/bottom_tab_cubit.dart' as _i4;
import '../presentation/pages/profile/cubit/user_profile_cubit.dart' as _i10;
import '../presentation/pages/sign_in/bloc/sign_in_bloc.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioHelper = _$DioHelper();
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.AuthInterceptor>(() => _i3.AuthInterceptor());
    gh.lazySingleton<_i4.BottomTabCubit>(() => _i4.BottomTabCubit());
    gh.factory<_i5.Dio>(() => dioHelper.configApiDio());
    gh.factoryParam<_i6.RestClient, String?, dynamic>((
      baseUrl,
      _,
    ) =>
        _i6.RestClient(
          gh<_i5.Dio>(),
          baseUrl: baseUrl,
        ));
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.SharedPreferencesManager>(
        () => _i8.SharedPreferencesManager(gh<_i7.SharedPreferences>()));
    gh.factory<_i9.TokenRefreshInterceptor>(() => _i9.TokenRefreshInterceptor(
        sharedPreferencesManager: gh<_i8.SharedPreferencesManager>()));
    gh.lazySingleton<_i10.UserProfileCubit>(() => _i10.UserProfileCubit());
    gh.factoryParam<_i11.AuthApiClient, String?, dynamic>((
      baseUrl,
      _,
    ) =>
        _i11.AuthApiClient(
          gh<_i5.Dio>(),
          baseUrl: baseUrl,
        ));
    gh.factory<_i12.AuthenticationRepositoryIml>(
        () => _i12.AuthenticationRepositoryIml(
              restClient: gh<_i6.RestClient>(),
              authApiClient: gh<_i11.AuthApiClient>(),
              sharedPreferencesManager: gh<_i8.SharedPreferencesManager>(),
            ));
    gh.factory<_i13.GetGuestSessionUseCase>(() => _i13.GetGuestSessionUseCase(
        authenticationRepositoryIml: gh<_i14.AuthenticationRepositoryIml>()));
    gh.factory<_i15.GetRequestTokenUseCase>(() => _i15.GetRequestTokenUseCase(
        authenticationRepositoryIml: gh<_i16.AuthenticationRepositoryIml>()));
    gh.factory<_i17.PostCreateAccessTokenUseCase>(() =>
        _i17.PostCreateAccessTokenUseCase(
            authenticationRepositoryIml:
                gh<_i12.AuthenticationRepositoryIml>()));
    gh.factory<_i18.PostCreateRequestTokenUseCase>(() =>
        _i18.PostCreateRequestTokenUseCase(
            authenticationRepositoryIml:
                gh<_i12.AuthenticationRepositoryIml>()));
    gh.factory<_i19.PostCreateSessionUseCase>(() =>
        _i19.PostCreateSessionUseCase(
            authenticationRepositoryIml:
                gh<_i16.AuthenticationRepositoryIml>()));
    gh.lazySingleton<_i20.PostLoginWithUsernameAndPasswordUseCase>(() =>
        _i20.PostLoginWithUsernameAndPasswordUseCase(
            authenticationRepositoryIml:
                gh<_i16.AuthenticationRepositoryIml>()));
    gh.lazySingleton<_i21.SignInBloc>(() => _i21.SignInBloc(
          gh<_i22.PostLoginWithUsernameAndPasswordUseCase>(),
          gh<_i22.GetRequestTokenUseCase>(),
          gh<_i23.SharedPreferencesManager>(),
          gh<_i22.PostCreateSessionUseCase>(),
        ));
    return this;
  }
}

class _$DioHelper extends _i24.DioHelper {}

class _$InjectionModule extends _i25.InjectionModule {}
