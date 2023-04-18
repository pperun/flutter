import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  late final String? city;
  late final String? region;
  late final String? country;

  Location.empty();

  Location({this.city, this.region, this.country});

  Location.fromJson(Map<String, dynamic> json)
      : city = json['name'],
        region = json['region'],
        country = json['country'];

  Map<String, dynamic> toJson() =>
      {'name': city ?? '', 'region': region ?? '', 'country': country ?? ''};

  @override
  List<Object?> get props => [city, region, country];
}
