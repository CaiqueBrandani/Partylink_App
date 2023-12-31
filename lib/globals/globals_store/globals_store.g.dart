// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalsStore on GlobalsStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'GlobalsStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$userAtom = Atom(name: 'GlobalsStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$GlobalsStoreBaseActionController =
      ActionController(name: 'GlobalsStoreBase', context: context);

  @override
  dynamic setLoading(dynamic value) {
    final _$actionInfo = _$GlobalsStoreBaseActionController.startAction(
        name: 'GlobalsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$GlobalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(dynamic value) {
    final _$actionInfo = _$GlobalsStoreBaseActionController.startAction(
        name: 'GlobalsStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$GlobalsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
user: ${user}
    ''';
  }
}
