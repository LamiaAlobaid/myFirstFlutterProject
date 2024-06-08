import 'package:flutter/material.dart';
import 'package:flutter_project/models/userr.dart';
import 'package:flutter_project/services/user_data.dart';
import 'package:flutter_project/widget/user_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<Userr>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = UserData().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Userr>>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCardWidget(
                  user: users[index],
                  onDelete: (user) async {
                    await UserData().deleteUser(user.id);
                    setState(() {
                      usersFuture = UserData().getAllUsers();
                    });
                  },
                  userData: UserData(),
                );
              },
            );
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 101, 60),
        title: const Text("Users data"),
        centerTitle: true,
      ),
    );
  }
}
