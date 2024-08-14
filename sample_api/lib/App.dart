import 'package:flutter/material.dart';
import 'package:sample_api/Pages/UserDetailsPage/UserDetailsPage.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserDetailsPage(),
    );
  }
}
