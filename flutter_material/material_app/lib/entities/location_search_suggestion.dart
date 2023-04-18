class LocationSearchSuggestion {
  late final String placeId;
  late final String description;

  LocationSearchSuggestion({required this.placeId, required this.description});

  LocationSearchSuggestion.empty() {
    placeId = '';
    description = '';
  }

  @override
  String toString() {
    return description;
  }

  bool isEmpty() => placeId == '' && description == '';
}
