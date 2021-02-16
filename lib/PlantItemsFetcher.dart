import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'TreflePlant.dart';

class PlantItemsFetcher {
  final _count = 100;
  final _itemsPerPage = 20;
  int _currentPages = 0;

  // This async function simulates fetching results from Internet, etc.
  Future<List<TreflePlant>> fetch() async {
    _currentPages++;
    String trefleToken = 'BnnICVvq5qkNm_3GBpkpG96vczmkT9h8xNBJl5UoVe0';
    String trefleUrlRequest = 'https://trefle.io/api/v1/plants?token=$trefleToken&page=$_currentPages&filter_not[common_name]=null&filter_not[scientific_name]=null';
    debugPrint(trefleUrlRequest);
    var response = await http.get(
        Uri.encodeFull(trefleUrlRequest),
        headers: {"Accept": "application/json"});

    var plantsResponse = json.decode(response.body);
    // List<TreflePlant> plantsList = [];
    List<TreflePlant> plantsList = plantsResponse['data']
        .map((jsonPlant) => TreflePlant.fromJson(jsonPlant))
        .toList()
        .cast<TreflePlant>();
    return plantsList;
  }
}