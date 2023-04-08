class WeatherCondition {
  final String condition;
  final String iconUrl;

  WeatherCondition({required this.condition, required this.iconUrl});

  WeatherCondition.fromJson(Map<String, dynamic> json)
      : condition = json['text'],
        iconUrl = 'http:${json['icon']}';

  Map<String, dynamic> toJson() =>
      {'text': condition, 'icon': iconUrl.replaceFirst(RegExp(r'http:'), '')};
}
