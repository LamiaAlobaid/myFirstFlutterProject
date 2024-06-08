import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/log_in.dart';
import 'package:flutter_project/pages/sign_up.dart';
import 'package:flutter_project/pages/user_page.dart';
import 'package:flutter_project/services/user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jzdkfinqylyountorhpg.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp6ZGtmaW5xeWx5b3VudG9yaHBnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ2NTU5NjMsImV4cCI6MjAzMDIzMTk2M30.YnQ_jWcy-QlCH3PuApHZ_H8E1pO_egOo4nkAWMMOyU8",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: SignUpPage()
    );
  }
    
}