class Location {
  final String city;
  final String region;
  final String country;

  Location({required this.city, required this.region, required this.country});

  Location.fromJson(Map<String, dynamic> json)
      : city = json['name'],
        region = json['region'],
        country = json['country'];

  Map<String, dynamic> toJson() =>
      {'name': city, 'region': region, 'country': country};
}
