import 'package:flutter/material.dart';

class Account {
  late int id;
  late String title;
  late String loginAccount;
  late String password;
  late String website;



  static const TABLE_NAME = 'accounts';

  Account();

  Account.fromMap(Map<String, dynamic> rowMap) {
    this.id = rowMap['id'];
    this.title = rowMap['title'];
    this.loginAccount = rowMap['login'];
    this.password = rowMap['password'];
    this.website = rowMap['website'];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['title'] = this.title;
    map['login'] = this.loginAccount;
    map['password'] = this.password;
    map['website'] = this.website;

    return map;
  }
}
