/// APIService class handles communication with the JSONPlaceholder API to fetch user data.
///
/// This class utilizes the Dio package to perform HTTP GET requests. The `fetchUsers` method
/// retrieves a list of users from the API endpoint `https://jsonplaceholder.typicode.com/users`.
/// 
/// Upon a successful request (HTTP status code 200), it parses the JSON response and converts
/// each user entry into a UserModel object, returning a list of UserModel instances. If the
/// request fails or no users are found, it logs an error message and returns an empty list.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_api/Models/UserModel.dart';

class APIService {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    try {
      List<UserModel> usersList = [];

      var usersData = await _dio.get("https://jsonplaceholder.typicode.com/users");

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
