import 'package:flutter/material.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/storage/controllers/accounts_db_controller.dart';

class AccountChangeNotifier extends ChangeNotifier {

  List<Account> accounts = <Account>[];

  AccountChangeNotifier() {
    read();
  }

  Future<void> read() async {
    accounts = await AccountDbController().read();
    notifyListeners();
  }

  Future<bool> create(Account data) async {
    int id = await AccountDbController().create(data);
    if (id != 0) {
      data.id = id;
      accounts.add(data);
      notifyListeners();
    }
    return id != 0;
  }

  Future<bool> update(Account data) async {
    bool updated = await AccountDbController().update(data);
    if (updated) {
      int index = accounts.indexWhere((contact) => contact.id == data.id);
      accounts[index] = data;
      notifyListeners();
    }
    return updated;
  }

  Future<bool> delete(int id) async {
    bool deleted = await AccountDbController().delete(id);
    if (deleted) {
      accounts.removeWhere((element) => element.id == id);
      notifyListeners();
    }
    return deleted;
  }}


