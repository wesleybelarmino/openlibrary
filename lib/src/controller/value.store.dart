import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:mobx/mobx.dart';
import 'package:openlibrary/src/core/constants.dart';
import 'package:openlibrary/src/core/failure/failure.dart';

part 'value.store.g.dart';

class ValueStore<State> = _ValueStoreBase<State> with _$ValueStore;

abstract class _ValueStoreBase<ValueType> with Store {
  _ValueStoreBase(ValueType initialValue) : _value = initialValue;

  @observable
  ValueType _value;
  @observable
  Failure? _failure;
  @observable
  var _isLoading = false;

  @computed
  ValueType get value => _value;

  @computed
  Failure? get failure => _failure;

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get hasFailure => _failure != null;

  @computed
  bool get isSuccessWithValue =>
      !hasFailure &&
      !isLoading &&
      (value is Option ? value is Some : value != null);

  @computed
  bool get isSuccess => !hasFailure && !isLoading;

  @action
  void setValue(ValueType value) {
    _value = value;
  }

  @action
  void setFailure(Failure? failure) {
    _failure = failure;
  }

  @action
  void setLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  Future<void> execute(Future<Either<Failure, ValueType>> Function() exec,
      {Duration? timeout}) async {
    setLoading(true);
    try {
      final result = await exec().timeout(timeout ?? k30Seconds);
      result.fold((failure) => setFailure(failure), (value) => setValue(value));
    } on TimeoutException catch (_) {
      setFailure(kTimeOutFailure);
    } catch (e) {
      setFailure(kAppFailure);
    } finally {
      setLoading(false);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueStore<ValueType> &&
        other._value == _value &&
        other._isLoading == _isLoading &&
        other._failure == _failure;
  }

  @override
  int get hashCode => _value.hashCode ^ _isLoading.hashCode ^ _failure.hashCode;
}
