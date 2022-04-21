// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../core/network/network.injectable_module.dart' as _i12;
import '../core/network/network_info.dart' as _i5;
import '../features/books/controller/books.controller.dart' as _i11;
import '../features/books/data/datasource/books_list.datasource.dart' as _i6;
import '../features/books/data/datasource/books_list_impl.datasource.dart'
    as _i7;
import '../features/books/data/repository/books_list_impl.repository.dart'
    as _i9;
import '../features/books/domain/reposity/books_list.repository.dart' as _i8;
import '../features/books/domain/usecases/get_books_list.usecase.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkInjectableModule = _$NetworkInjectableModule();
  gh.lazySingleton<_i3.Client>(() => networkInjectableModule.httpClient);
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => networkInjectableModule.internetConnectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.BooksListDataSource>(
      () => _i7.BooksListDataSourceImpl(get<_i3.Client>()));
  gh.lazySingleton<_i8.BooksListRepository>(() => _i9.BooksListRepositoryImpl(
      get<_i6.BooksListDataSource>(), get<_i5.NetworkInfo>()));
  gh.factory<_i10.GetBooksListUsecase>(
      () => _i10.GetBooksListUsecase(get<_i8.BooksListRepository>()));
  gh.factory<_i11.BooksController>(
      () => _i11.BooksController(get<_i10.GetBooksListUsecase>()));
  return get;
}

class _$NetworkInjectableModule extends _i12.NetworkInjectableModule {}
