import 'package:myapp/features/weather_report/data/weather_report_datasource.dart';
import 'package:myapp/features/weather_report/domain/weather_report_model.dart';

abstract class WeatherReportRepository {
  Future<WeatherReport> getWeatherReport();
}

class WeatherReportRepositoryImpl implements WeatherReportRepository {
  final WeatherReportDatasource datasource;

  WeatherReportRepositoryImpl({required this.datasource});

  @override
  Future<WeatherReport> getWeatherReport() async {
    return datasource.getWeatherReport();
  }
}
