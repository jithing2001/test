import 'package:flutter/material.dart';
import 'package:test/model/detail_model.dart';
import 'package:test/view/details/detail_screen.dart';

class CityScreen extends StatelessWidget {
  final List cities;
  CityScreen({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              DetailModel.city = cities[index].cityName;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailScreen(),
              ));
            },
            child: ListTile(
              title: Text(cities[index].cityName),
            ),
          );
        },
      ),
    );
  }
}
