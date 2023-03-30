class Location {
  final String city;
  final String region;
  final String country;

  Location({required this.city, required this.region, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        city: json['name'], 
        region: json['region'], 
        country: json['country']
        );
  }
}
