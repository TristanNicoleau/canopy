import 'package:flutter/material.dart';
import 'screens/PlantsListPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CanopyApp());
}

class CanopyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canopy',
      theme: ThemeData(
        textTheme: GoogleFonts.lexendExaTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => PlantsListPage()
      },
    );
  }
}
