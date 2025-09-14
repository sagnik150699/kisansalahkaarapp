class WeatherReport {
  final String temperature;
  final String humidity;
  final String wind;
  final List<Forecast> forecast;

  WeatherReport({
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.forecast,
  });
}

class Forecast {
  final String time;
  final String condition;
  final String temperature;

  Forecast({
    required this.time,
    required this.condition,
    required this.temperature,
  });
}
