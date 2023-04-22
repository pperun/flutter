import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:material_app/entities/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationsProvider with ChangeNotifier {
  Set<Location> locations;

  LocationsProvider({Set<Location>? locations}) : locations = locations ?? {};

  void addLocation(Location location) {
    locations.add(location);
    putLocationsInCache();
    notifyListeners();
  }

  Future<Set<Location>> getLocationsFromCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? json = sharedPreferences.getString('locations');
    if(json == null) {
      return {};
    }

    List<dynamic> decodedJson = jsonDecode(json);
    locations = decodedJson.map((e) => Location.fromJson(e as Map<String, dynamic>)).toSet();

    return locations;
  }

  void putLocationsInCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('locations', jsonEncode([for(final Location location in locations) location.toJson()]));
  }
}
