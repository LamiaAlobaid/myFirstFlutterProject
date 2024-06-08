import 'package:flutter/material.dart';
import 'package:flutter_project/models/plant.dart';
import 'package:flutter_project/pages/details_page.dart';

class PlantCardWidget extends StatelessWidget {
  // here are the things that comes from outside
  final Plant plant;
  const PlantCardWidget({ super.key,required this.plant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(plant: plant),
                    ),
                  );
                },
      child: Container(
        color: Colors.grey.shade200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("${plant.name.toString()}"),
      
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(plant.image!),
                  
            ),
            Text("Price: \$${plant.price.toString()}"),
            Text("Rating: ${plant.rating.toString()}"),
          ],
        ),
      ),
    );
  }
}
