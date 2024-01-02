import 'package:flutter/material.dart';
import 'package:test/view/home/input_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait(context);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
                'assets/images/pngtree-planet-earth-globe-isolated-elements-of-this-image-furnished-by-nasa-picture-image_2272380.jpg'),
          )
        ],
      ),
    );
  }

  wait(BuildContext context) {
    Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => InputScreen(),
    ));
  }
}
