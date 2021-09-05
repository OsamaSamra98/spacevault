import 'package:flutter/material.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/storage/db_operations.dart';
import 'package:project_spacevault/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class AccountDbController implements DbOperations<Account> {
  Database _database;

  AccountDbController() : _database = DBProvider().database;

  @override
  Future<int> create(Account data) async {
    return await _database.insert(Account.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await _database
        .delete(Account.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Account>> read() async {
    var rowsMaps = await _database.query(Account.TABLE_NAME);
    return rowsMaps.map((rowMap) => Account.fromMap(rowMap)).toList();
  }

  @override
  Future<Account?> show(int id) async {
    var data = await _database
        .query(Account.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty
        ? data.map((rowMap) => Account.fromMap(rowMap)).first
        : null;
  }

  @override
  Future<bool> update(Account data) async {
    // TODO: implement update
    int countOfUpdatedRows = await _database.update(
        Account.TABLE_NAME, data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }
}
