import 'package:canopy_app/models/TreflePlant.dart';
import 'package:flutter/material.dart';

class PlantListItem extends StatefulWidget {
  final TreflePlant plant;
  final VoidCallback onTap;

  PlantListItem({Key key, this.plant, this.onTap}) : super(key: key);

  @override
  _PlantListItemState createState() => _PlantListItemState();
}

class _PlantListItemState extends State<PlantListItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.asset(plant.image_url),
      title: Text(
        widget.plant.common_name,
        style: TextStyle(fontSize: 18.0),
      ),
      subtitle: Text(widget.plant.scientific_name),
      onTap: () {
        widget.onTap();
      },
    );
  }
}