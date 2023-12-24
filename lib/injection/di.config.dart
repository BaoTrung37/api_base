// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../data/iml_repositories/authentication/authentication.dart' as _i9;
import '../data/iml_repositories/authentication/authentication_repository_iml.dart'
    as _i6;
import '../data/iml_repositories/iml_repositories.dart' as _i11;
import '../data/services/network_services/interceptors/auth_interceptor.dart'
    as _i3;
import '../data/services/network_services/rest_client.dart' as _i7;
import '../data/services/preference_services/injection_module.dart' as _i16;
import '../data/services/preference_services/shared_preference_manager.dart'
    as _i5;
import '../domain/use_cases/authentication/get_guest_session_use_case.dart'
    as _i8;
import '../domain/use_cases/authentication/get_request_token_use_case.dart'
    as _i10;
import '../domain/use_cases/authentication/post_create_session_use_case.dart'
    as _i12;
import '../domain/use_cases/authentication/post_login_with_username_and_password_use_case.dart'
    as _i13;
import '../domain/use_cases/use_cases.dart' as _i15;
import '../presentation/pages/sign_in/bloc/sign_in_bloc.dart' as _i14;

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
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.AuthInterceptor>(() => _i3.AuthInterceptor());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.SharedPreferencesManager>(
        () => _i5.SharedPreferencesManager(gh<_i4.SharedPreferences>()));
    gh.factory<_i6.AuthenticationRepositoryIml>(
        () => _i6.AuthenticationRepositoryIml(
              restClient: gh<_i7.RestClient>(),
              sharedPreferencesManager: gh<_i5.SharedPreferencesManager>(),
            ));
    gh.factory<_i8.GetGuestSessionUseCase>(() => _i8.GetGuestSessionUseCase(
        authenticationRepositoryIml: gh<_i9.AuthenticationRepositoryIml>()));
    gh.factory<_i10.GetRequestTokenUseCase>(() => _i10.GetRequestTokenUseCase(
        authenticationRepositoryIml: gh<_i11.AuthenticationRepositoryIml>()));
    gh.factory<_i12.PostCreateSessionUseCase>(() =>
        _i12.PostCreateSessionUseCase(
            authenticationRepositoryIml:
                gh<_i11.AuthenticationRepositoryIml>()));
    gh.lazySingleton<_i13.PostLoginWithUsernameAndPasswordUseCase>(() =>
        _i13.PostLoginWithUsernameAndPasswordUseCase(
            authenticationRepositoryIml:
                gh<_i11.AuthenticationRepositoryIml>()));
    gh.lazySingleton<_i14.SignInBloc>(() =>
        _i14.SignInBloc(gh<_i15.PostLoginWithUsernameAndPasswordUseCase>()));
    return this;
  }
}

class _$InjectionModule extends _i16.InjectionModule {}
