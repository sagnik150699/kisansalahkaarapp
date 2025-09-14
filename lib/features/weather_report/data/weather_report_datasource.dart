import 'package:myapp/features/weather_report/domain/weather_report_model.dart';

class WeatherReportDatasource {
  Future<WeatherReport> getWeatherReport() async {
    // This is a dummy implementation
    await Future.delayed(const Duration(seconds: 1));
    return WeatherReport(
      temperature: 30.0,
      humidity: 70,
      wind: '10 km/h East',
    );
  }
}
