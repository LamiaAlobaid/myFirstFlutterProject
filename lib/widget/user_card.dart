import 'package:flutter/material.dart';
import 'package:flutter_project/models/userr.dart';
import 'package:flutter_project/services/user_data.dart';

class UserCardWidget extends StatelessWidget {
  final Userr user;
  final Function(Userr) onDelete;
  final UserData userData;

  const UserCardWidget({
    Key? key,
    required this.user,
    required this.onDelete,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${user.name}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Email: ${user.email}"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Call the deleteUser method from the UserData instance
              userData.deleteUser(user.id);
              // Call the onDelete callback passed from the parent widget
              onDelete(user);
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
