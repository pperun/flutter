import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:material_app/entities/location_search_suggestion.dart';

import '../entities/location.dart';

class PlacesApiClient {
  PlacesApiClient(this.sessionToken);

  final String sessionToken;

  static const String apiKey = 'AIzaSyB1Dcyel0jz3wuCZj5XDNFXAKW1dbxfmOE';

  Future<List<LocationSearchSuggestion>> fetchSuggestions(
      String input, String lang) async {
    final response = await http.get(Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/autocomplete/json',
        queryParameters: {
          'input': input,
          'types': ['(cities)'],
          'language': lang,
          'key': apiKey,
          'sessiontoken': sessionToken
        }));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<LocationSearchSuggestion>((p) => LocationSearchSuggestion(
                placeId: p['place_id'], description: p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Location> getPlaceDetailFromId(String placeId) async {
    final response = await http.get(Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/details/json',
        queryParameters: {
          'place_id': placeId,
          'fields': 'address_component',
          'key': apiKey,
          'sessiontoken': sessionToken
        }));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        var location = Location.empty();

        for (var c in components) {
          final List type = c['types'];
          if (type.contains('locality')) {
            location.city = c['long_name'];
          } else if (type.contains('administrative_area_level_1')) {
            location.region = c['long_name'];
          } else if (type.contains('country')) {
            location.country = c['long_name'];
          }
        }
        return location;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
