import 'package:canopy_app/models/TreflePlant.dart';
import 'package:canopy_app/screens/PlantDetailsPage.dart';
import 'package:canopy_app/services/PlantItemsFetcher.dart';
import 'package:canopy_app/widgets/PlantListItem.dart';
import 'package:flutter/material.dart';

class PlantsListPage extends StatefulWidget {
  PlantsListPage({Key key}) : super(key: key);

  @override
  _PlantsListPageState createState() => _PlantsListPageState();
}

class _PlantsListPageState extends State<PlantsListPage> {
  final List<TreflePlant> _plants = [];
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
        title: Text("Plants list"),
      ),
      body: Center(
        child: PlantsList(),
      ),
    );
  }

  Widget PlantsList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _hasMore ? _plants.length + 1 : _plants.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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
          return PlantListItem(
            // key: Key('can_plants_list_list_item'),
            plant: _plants[index],
            onTap: () {
              _pushPlantDetails(_plants[index]);
            },
          );
        });
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
