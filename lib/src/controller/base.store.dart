import 'package:collection/src/iterable_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:openlibrary/src/controller/value.store.dart';
import 'package:openlibrary/src/core/failure/failure.dart';

part 'base.store.g.dart';

abstract class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase extends Disposable with Store {
  @protected
  Iterable<ValueStore> get getStates;

  @computed
  @nonVirtual
  Iterable<ValueStore> get states => getStates;

  @computed
  @nonVirtual
  Failure? get failure => states
      .firstWhere((element) => element.hasFailure,
          orElse: () => ValueStore(null))
      .failure;

  @computed
  @nonVirtual
  bool get isLoading => states.any((element) => element.isLoading);

  @computed
  @nonVirtual
  bool get hasFailure => states.any((element) => element.hasFailure);

  @protected
  @nonVirtual
  Future<void> execute<T>(Future<Either<Failure, T>> Function() exec) async {
    ValueStore? state =
        states.firstWhereOrNull((element) => element is ValueStore<T>);
    if (state != null) {
      try {
        return state.execute(exec);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print(
          'Não foi possível encontraro estado na lista de estados, verifique se está registrado.');
    }
  }

  @nonVirtual
  void clearErros() {
    states.where((state) => state.hasFailure).forEach((state) {
      state.setFailure(null);
    });
  }

  @override
  @nonVirtual
  @mustCallSuper
  Future<void> onDispose() async {}
}
