import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:partylink/model/user_model.dart';
part 'globals_store.g.dart';

class GlobalsStore = GlobalsStoreBase with _$GlobalsStore;

abstract class GlobalsStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  User? user;

  @action
  setLoading(value) => loading = value;

  @action
  void setUser(value) {
    final parsed = json.decode(value);

    if (parsed != null && parsed['data'] != null) {
      try {
        List<dynamic> userListData = parsed['data'];

        List<User> user =
            userListData.map((userData) => User.fromJson(userData)).toList();
      } catch (e) {
        log('ERRO AO ADICIONAR USER >>> $e');
      }
    }
  }
}