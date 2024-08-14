import 'package:flutter/material.dart';
import 'package:sample_api/Models/UserModel.dart';
import 'package:sample_api/Pages/UserDetailsViewModel/UserDetailsViewModel.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserDetailsViewModel vm = UserDetailsViewModel();

  @override
  void initState() {
    super.initState();
    vm.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
          future: vm.loadUsers(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              List<UserModel> items = snapshot.data;

              return ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      items[index].id.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(items[index].name),
                    subtitle: Text(items[index].email),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          },
        ),
      ),
    ));
  }
}
