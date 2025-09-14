import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/weather_report/data/weather_report_datasource.dart';
import 'package:myapp/features/weather_report/domain/weather_report_model.dart';
import 'package:myapp/features/weather_report/domain/weather_report_repository.dart';

final weatherReportDatasourceProvider = Provider((ref) => WeatherReportDatasource());

final weatherReportRepositoryProvider = Provider<WeatherReportRepository>((ref) {
  final datasource = ref.watch(weatherReportDatasourceProvider);
  return WeatherReportRepositoryImpl(datasource: datasource);
});

final weatherReportProvider = FutureProvider.autoDispose<WeatherReport>((ref) {
  final repository = ref.watch(weatherReportRepositoryProvider);
  return repository.getWeatherReport();
});
