// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote_data_sources/articles_remote_data_source.dart' as _i4;
import '../data/remote_data_sources/authors_remote_data_source.dart' as _i6;
import '../domain/repositories/articles_repository.dart' as _i5;
import '../domain/repositories/authors_repository.dart' as _i7;
import '../features/articles/cubit/articles_cubit.dart' as _i9;
import '../features/home/cubit/home_cubit.dart' as _i8;
import 'injection_container.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.ArticlesRemoteRetrofitDataSource>(
      () => _i4.ArticlesRemoteRetrofitDataSource(get<_i3.Dio>()));
  gh.factory<_i5.ArticlesRepository>(() => _i5.ArticlesRepository(
      remoteDataSource: get<_i4.ArticlesRemoteRetrofitDataSource>()));
  gh.factory<_i6.AuthorsRemoteRetroFitDataSource>(
      () => _i6.AuthorsRemoteRetroFitDataSource(get<_i3.Dio>()));
  gh.factory<_i7.AuthorsRepository>(() => _i7.AuthorsRepository(
      remoteDataSource: get<_i6.AuthorsRemoteRetroFitDataSource>()));
  gh.factory<_i8.HomeCubit>(
      () => _i8.HomeCubit(authorsRepository: get<_i7.AuthorsRepository>()));
  gh.factory<_i9.ArticlesCubit>(() =>
      _i9.ArticlesCubit(articlesRepository: get<_i5.ArticlesRepository>()));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
