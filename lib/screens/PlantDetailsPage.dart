import 'package:canopy_app/models/TreflePlant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantDetailsPage extends StatefulWidget {
  final TreflePlant plant;

  PlantDetailsPage({Key key, this.plant}) : super(key: key);

  @override
  _PlantDetailsPageState createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(widget.plant.image_url)),
                )
              ],
            ),
            Text(
              widget.plant.common_name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w900,
                  fontSize: 26),
            ),
            Text(
              widget.plant.scientific_name,
            ),
            Text(
              "Specifications",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            Text(widget.plant.family_common_name),
            Text(widget.plant.bibliography),
            Text(
              "Growing",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            Text(widget.plant.genus),
          ],
        ),
      ),
    );
  }
}
