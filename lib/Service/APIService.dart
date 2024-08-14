import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_api/Models/UserModel.dart';

class APIService {
  final Dio _dio = Dio();
  Future<List<UserModel>> fetchUsers() async {
    try {
      List<UserModel> usersList = [];

      var usersData =
          await _dio.get("https://jsonplaceholder.typicode.com/users");

      List userJsonData = usersData.data;

      if (usersData.statusCode == 200 && userJsonData.isNotEmpty) {
        for (var element in userJsonData) {
          var userData = UserModel.fromJson(element);
          usersList.add(userData);
        }
        return usersList;
      } else {
        debugPrint("Unable to fetch users data");
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
