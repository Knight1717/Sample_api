import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_api/Models/UserModel.dart';
import 'package:sample_api/Service/APIService.dart';

class UserDetailsViewModel {
  final service = GetIt.instance<APIService>();

  Future<List<UserModel>> loadUsers() async {
    try {
      return await service.fetchUsers();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
