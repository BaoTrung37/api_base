// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/iml_repositories/utils_repository_imp.dart' as _i5;
import '../data/services/network_services/dio_helper.dart' as _i7;
import '../data/services/network_services/rest_client.dart' as _i4;
import '../domain/use_cases/utils/get_genres_use_case.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioHelper = _$DioHelper();
    gh.factory<_i3.Dio>(() => dioHelper.configApiDio());
    gh.factoryParam<_i4.RestClient, String?, dynamic>((
      baseUrl,
      _,
    ) =>
        _i4.RestClient(
          gh<_i3.Dio>(),
          baseUrl: baseUrl,
        ));
    gh.factory<_i5.UtilsRepositoryImp>(
        () => _i5.UtilsRepositoryImp(restClient: gh<_i4.RestClient>()));
    gh.factory<_i6.GetGenresUseCase>(() =>
        _i6.GetGenresUseCase(utilsRepositoryImp: gh<_i5.UtilsRepositoryImp>()));
    return this;
  }
}

class _$DioHelper extends _i7.DioHelper {}
