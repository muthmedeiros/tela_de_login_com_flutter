// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeStore = BindInject(
  (i) => HomeStore(i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$logoutAuthAsyncAction = AsyncAction('_HomeStore.logoutAuth');

  @override
  Future<dynamic> logoutAuth() {
    return _$logoutAuthAsyncAction.run(() => super.logoutAuth());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
