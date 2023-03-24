class WeatherCondition {
  final String condition;
  final String iconUrl;

  WeatherCondition({required this.condition, required this.iconUrl});

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(condition: json['text'], iconUrl: 'http:${json['icon']}');
  }
}