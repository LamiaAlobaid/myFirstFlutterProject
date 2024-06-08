import 'package:flutter/material.dart';
import 'package:flutter_project/data/plants_data.dart';
import 'package:flutter_project/models/plant.dart';
import 'package:flutter_project/pages/log_in.dart';
import 'package:flutter_project/widget/plant_card.dart';
import 'package:flutter_project/pages/user_page.dart'; 

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Plant> plantList = [];

  @override
  void initState() {
    super.initState();
    for (var element in plantsData) {
      plantList.add(Plant.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 101, 60),
        title: Text("Welcome ${widget.name}"), 
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogInPage()),
            );
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(), 
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.person,
                size: 30, 
                color: Color.fromARGB(255, 26, 25, 25) ,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plantList.length,
        itemBuilder: (context, index) {
          return PlantCardWidget(plant: plantList[index]);
        },
      ),
    );
  }
}
