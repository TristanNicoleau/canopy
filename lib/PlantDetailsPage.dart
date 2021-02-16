import 'package:canopy_app/TreflePlant.dart';
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
      body: Column(
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
          Text(widget.plant.common_name),
          Text(widget.plant.scientific_name),
          Text(widget.plant.family_common_name),
          Text(widget.plant.genus),
        ],
      ),
    );
  }
}
