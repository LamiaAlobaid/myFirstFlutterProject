import 'package:flutter/material.dart';
import 'package:flutter_project/models/plant.dart';

class Details extends StatelessWidget {
  final Plant plant;

  const Details({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 101, 60),
        title: Text("Plant Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            plant.image != null
                ? Image.network(
                    plant.image!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : SizedBox(),
            SizedBox(height: 20),
            Text("${plant.name}"),
            Text("${plant.type}", style: TextStyle(color: Colors.grey)),
            Text(
              "\$${plant.price.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(" ${plant.rating.toString()}"),
                  Icon(Icons.star, color: Color.fromARGB(255, 244, 220, 2)),
                ],
              ),
            ),
            Text("${plant.description.toString()}"),
          ],
        ),
      ),
    );
  }
}
