import 'package:flutter/material.dart';
import 'PlantsListPage.dart';

void main() {
  runApp(CanopyApp());
}

class CanopyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canopy',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantsListPage(),
    );
  }
}
