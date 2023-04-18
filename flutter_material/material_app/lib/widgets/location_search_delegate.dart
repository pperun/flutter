import 'package:flutter/material.dart';
import 'package:material_app/entities/location_search_suggestion.dart';
import 'package:material_app/http/places_api_client.dart';

class LocationSearchDelegate extends SearchDelegate<LocationSearchSuggestion> {
  final String sessionToken;
  final PlacesApiClient apiClient;

  LocationSearchDelegate({required this.sessionToken})
      : apiClient = PlacesApiClient(sessionToken);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, LocationSearchSuggestion.empty());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ''
          ? null
          : apiClient.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text('Enter your address'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data![index].toString()),
                    onTap: () {
                      close(context, snapshot.data![index]);
                    },
                  ),
                  itemCount: snapshot.data!.length,
                )
              : Container(),
    );
  }
}
