import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/models/users_models.dart';
import 'package:gennexs_workshop_flutter_basic/service/login_service.dart';

class GetData extends ChangeNotifier {
  GetUsers? _users;
  GetUsers? get users => _users;

  Future<void> getUserProvider() async {
    _users = await AuthService().fetchUsers();
    notifyListeners();
  }
}
