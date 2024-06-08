import 'package:flutter_project/models/userr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';

class UserData{
  // use 'subpase' to do any thing
  final supbase = Supabase.instance.client;

// this function will return a list that take a while to come, so we have to use future
   Future<List<Userr>>getAllUsers() async {
    final data =await supbase.from("User").select();

    // convert 'data' to a model then add it to a list
    List<Userr> allUser=[];
    for (var element in data) {
      allUser.add(Userr.fromJson(element));
    }
    return allUser;
  }

  //log in function
 Future<List> getSpecificUser(
      {required String email, required String password}) async {
    final data = await supbase
        .from("User")
        .select()
        .match({"email": email, "password": password});

    return data;
  }

  //delete user function
Future<void> deleteUser(int? userId) async {
  await supbase.from("User").delete().eq('id', userId as Object);
}

// add user function
insertUser(Userr user) async {
    await supbase.from("User").insert(user.toJson());
  }


}
 
