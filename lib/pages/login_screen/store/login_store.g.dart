// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$loginControllerEmailAtom =
      Atom(name: 'LoginStoreBase.loginControllerEmail', context: context);

  @override
  TextEditingController get loginControllerEmail {
    _$loginControllerEmailAtom.reportRead();
    return super.loginControllerEmail;
  }

  @override
  set loginControllerEmail(TextEditingController value) {
    _$loginControllerEmailAtom.reportWrite(value, super.loginControllerEmail,
        () {
      super.loginControllerEmail = value;
    });
  }

  late final _$loginControllerPasswordAtom =
      Atom(name: 'LoginStoreBase.loginControllerPassword', context: context);

  @override
  TextEditingController get loginControllerPassword {
    _$loginControllerPasswordAtom.reportRead();
    return super.loginControllerPassword;
  }

  @override
  set loginControllerPassword(TextEditingController value) {
    _$loginControllerPasswordAtom
        .reportWrite(value, super.loginControllerPassword, () {
      super.loginControllerPassword = value;
    });
  }

  late final _$registerControllerNameAtom =
      Atom(name: 'LoginStoreBase.registerControllerName', context: context);

  @override
  TextEditingController get registerControllerName {
    _$registerControllerNameAtom.reportRead();
    return super.registerControllerName;
  }

  @override
  set registerControllerName(TextEditingController value) {
    _$registerControllerNameAtom
        .reportWrite(value, super.registerControllerName, () {
      super.registerControllerName = value;
    });
  }

  late final _$registerControllerEmailAtom =
      Atom(name: 'LoginStoreBase.registerControllerEmail', context: context);

  @override
  TextEditingController get registerControllerEmail {
    _$registerControllerEmailAtom.reportRead();
    return super.registerControllerEmail;
  }

  @override
  set registerControllerEmail(TextEditingController value) {
    _$registerControllerEmailAtom
        .reportWrite(value, super.registerControllerEmail, () {
      super.registerControllerEmail = value;
    });
  }

  late final _$registerControllerPhoneAtom =
      Atom(name: 'LoginStoreBase.registerControllerPhone', context: context);

  @override
  TextEditingController get registerControllerPhone {
    _$registerControllerPhoneAtom.reportRead();
    return super.registerControllerPhone;
  }

  @override
  set registerControllerPhone(TextEditingController value) {
    _$registerControllerPhoneAtom
        .reportWrite(value, super.registerControllerPhone, () {
      super.registerControllerPhone = value;
    });
  }

  late final _$registerControllerAddressAtom =
      Atom(name: 'LoginStoreBase.registerControllerAddress', context: context);

  @override
  TextEditingController get registerControllerAddress {
    _$registerControllerAddressAtom.reportRead();
    return super.registerControllerAddress;
  }

  @override
  set registerControllerAddress(TextEditingController value) {
    _$registerControllerAddressAtom
        .reportWrite(value, super.registerControllerAddress, () {
      super.registerControllerAddress = value;
    });
  }

  late final _$registerControllerPasswordAtom =
      Atom(name: 'LoginStoreBase.registerControllerPassword', context: context);

  @override
  TextEditingController get registerControllerPassword {
    _$registerControllerPasswordAtom.reportRead();
    return super.registerControllerPassword;
  }

  @override
  set registerControllerPassword(TextEditingController value) {
    _$registerControllerPasswordAtom
        .reportWrite(value, super.registerControllerPassword, () {
      super.registerControllerPassword = value;
    });
  }

  late final _$hasLoginAtom =
      Atom(name: 'LoginStoreBase.hasLogin', context: context);

  @override
  bool get hasLogin {
    _$hasLoginAtom.reportRead();
    return super.hasLogin;
  }

  @override
  set hasLogin(bool value) {
    _$hasLoginAtom.reportWrite(value, super.hasLogin, () {
      super.hasLogin = value;
    });
  }

  late final _$jsonLoginAtom =
      Atom(name: 'LoginStoreBase.jsonLogin', context: context);

  @override
  Map<String, dynamic> get jsonLogin {
    _$jsonLoginAtom.reportRead();
    return super.jsonLogin;
  }

  @override
  set jsonLogin(Map<String, dynamic> value) {
    _$jsonLoginAtom.reportWrite(value, super.jsonLogin, () {
      super.jsonLogin = value;
    });
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  dynamic setButtonValue(dynamic value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setButtonValue');
    try {
      return super.setButtonValue(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLogin(dynamic jsonBody, dynamic jsonResponse) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setLogin');
    try {
      return super.setLogin(jsonBody, jsonResponse);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginControllerEmail: ${loginControllerEmail},
loginControllerPassword: ${loginControllerPassword},
registerControllerName: ${registerControllerName},
registerControllerEmail: ${registerControllerEmail},
registerControllerPhone: ${registerControllerPhone},
registerControllerAddress: ${registerControllerAddress},
registerControllerPassword: ${registerControllerPassword},
hasLogin: ${hasLogin},
jsonLogin: ${jsonLogin}
    ''';
  }
}
