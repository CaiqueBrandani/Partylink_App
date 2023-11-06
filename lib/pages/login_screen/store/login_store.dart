import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  TextEditingController loginControllerEmail = TextEditingController();

  @observable
  TextEditingController loginControllerPassword = TextEditingController();

  @observable
  TextEditingController registerControllerName = TextEditingController();

  @observable
  TextEditingController registerControllerEmail = TextEditingController();

  @observable
  TextEditingController registerControllerPhone = TextEditingController();

  @observable
  TextEditingController registerControllerAddress = TextEditingController();

  @observable
  TextEditingController registerControllerPassword = TextEditingController();

  @observable
  bool hasLogin = true;

  @action
  setButtonValue(value) => hasLogin = value;
}