import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_api/App.dart';
import 'package:sample_api/Service/APIService.dart';

void main() {
  runApp(const MainApp());
  registerServices();
}

void registerServices() {
  GetIt.instance.registerSingleton<APIService>(APIService());
}
