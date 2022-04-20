// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;

import '../core/network/internet_connection_checker.injectable_module.dart'
    as _i10;
import '../core/network/network_info.dart' as _i7;
import '../features/books/data/datasource/books_list.datasource.dart' as _i3;
import '../features/books/data/datasource/books_list_impl.datasource.dart'
    as _i4;
import '../features/books/data/repository/books_list_impl.repository.dart'
    as _i9;
import '../features/books/domain/reposity/books_list.repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final internetConnectionCheckerInjectableModule =
      _$InternetConnectionCheckerInjectableModule();
  gh.lazySingleton<_i3.BooksListDataSource>(
      () => _i4.BooksListDataSourceImpl(get<_i5.Client>()));
  gh.lazySingleton<_i6.InternetConnectionChecker>(() =>
      internetConnectionCheckerInjectableModule.internetConnectionChecker);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i6.InternetConnectionChecker>()));
  gh.lazySingleton<_i8.BooksListRepository>(() => _i9.BooksListRepositoryImpl(
      get<_i3.BooksListDataSource>(), get<_i7.NetworkInfo>()));
  return get;
}

class _$InternetConnectionCheckerInjectableModule
    extends _i10.InternetConnectionCheckerInjectableModule {}
