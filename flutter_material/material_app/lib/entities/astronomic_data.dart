import 'package:intl/intl.dart';

class AstronomicData {
  final DateTime sunrise;
  final DateTime sunset;
  late final DateTime? moonrise;
  late final DateTime? moonset;
  final String moonPhase;

  AstronomicData(
      {required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moonPhase});

  AstronomicData.fromJson(Map<String, dynamic> json)
      : sunrise = DateFormat('yyyy-MM-dd hh:mm aaa')
            .parse('${json['date']} ${json['astro']['sunrise']}'),
        sunset = DateFormat('yyyy-MM-dd hh:mm aaa')
            .parse('${json['date']} ${json['astro']['sunset']}'),
        moonPhase = json['astro']['moon_phase'] {
    try {
      moonrise = DateFormat('yyyy-MM-dd hh:mm aaa')
          .parse('${json['date']} ${json['astro']['moonrise']}');
    } catch (e) {
      moonrise = null;
    }
    try {
      moonset = DateFormat('yyyy-MM-dd hh:mm aaa')
          .parse('${json['date']} ${json['astro']['moonset']}');
    } catch (e) {
      moonset = null;
    }
  }

  Map<String, dynamic> toJson() => {
        'sunrise': DateFormat('hh:mm a').format(sunrise),
        'sunset': DateFormat('hh:mm a').format(sunset),
        'moonrise': moonrise == null
            ? 'No moonrise'
            : DateFormat('hh:mm a').format(moonrise!),
        'moonset': moonset == null
            ? 'No moonset'
            : DateFormat('hh:mm a').format(moonset!),
        'moon_phase': moonPhase
      };
}
