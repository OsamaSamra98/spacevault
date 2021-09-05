

import 'package:project_spacevault/models/accounts.dart';

abstract class DbOperations <T> {

  Future<int> create(T data);

  Future<List<T>> read();

  Future<T?> show(int id);

  Future<bool> update(T data);

  Future<bool> delete(int id);


}