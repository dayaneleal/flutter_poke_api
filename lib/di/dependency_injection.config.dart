// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_poke_api/data/repository/pokemon_repository.dart'
    as _i5;
import 'package:flutter_poke_api/domain/repository/pokemon_repository_impl.dart'
    as _i6;
import 'package:flutter_poke_api/network/network_module.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.PrettyDioLogger>(
    () => networkModule.prettyDioLogger(),
    instanceName: 'PrettyDioLogger',
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i4.Dio>(networkModule.provideDio(
    gh<String>(instanceName: 'BaseUrl'),
    gh<_i3.PrettyDioLogger>(instanceName: 'PrettyDioLogger'),
  ));
  gh.factory<_i5.PokemonRepository>(
      () => _i6.PokemonRepositoryImpl(gh<_i4.Dio>()));
  return getIt;
}

class _$NetworkModule extends _i7.NetworkModule {}
