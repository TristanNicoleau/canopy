import 'package:canopy_app/PlantDetailsPage.dart';
import 'package:flutter/material.dart';
import 'TreflePlant.dart';
import 'PlantItemsFetcher.dart';

class PlantsListPage extends StatefulWidget {
  PlantsListPage({Key key}) : super(key: key);

  @override
  _PlantsListPageState createState() => _PlantsListPageState();
}

class _PlantsListPageState extends State<PlantsListPage> {
  final List<TreflePlant> _plants = [];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _plantItemsFetcher = PlantItemsFetcher();

  bool _isLoading = true;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
  }

  void _loadMore() {
    _isLoading = true;
    _plantItemsFetcher.fetch().then((List<TreflePlant> fetchedPlantsList) {
      if (fetchedPlantsList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _plants.addAll(fetchedPlantsList);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes plantes"),
      ),
      body: Center(
        child: _buildPlantsList(),
      ),
    );
  }

  Widget _buildPlantsList() {
    if (_plants == null || _plants.length < 0) {
      return Container(
        child: Center(
          child: Text("Please wait..."),
        ),
      );
    }

    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _hasMore ? _plants.length + 1 : _plants.length,
        itemBuilder: (BuildContext context, int index) {
          if (index >= _plants.length) {
            if (!_isLoading) {
              _loadMore();
            }
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 24,
                width: 24,
              ),
            );
          }

          if (index.isOdd) return Divider();
          return _buildPlantItem(_plants[index]);
        });
  }

  Widget _buildPlantItem(TreflePlant plant) {
    var listeTile = ListTile(
      // leading: Image.asset(plant.image_url),
      title: Text(
        plant.common_name,
        style: _biggerFont,
      ),
      subtitle: Text(plant.scientific_name),
      onTap: () {
        _pushPlantDetails(plant);
      },
    );

    return listeTile;
  }

  void _pushPlantDetails(TreflePlant plant) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return PlantDetailsPage(plant: plant);
        },
      ),
    );
  }
}
