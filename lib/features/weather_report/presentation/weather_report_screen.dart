import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_salahkaar/features/weather_report/presentation/weather_report_provider.dart';

class WeatherReportScreen extends ConsumerWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherReport = ref.watch(weatherReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Report'),
      ),
      body: weatherReport.when(
        data: (report) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Weather',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text('Temperature: ${report.temperature}'),
                Text('Humidity: ${report.humidity}'),
                Text('Wind: ${report.wind}'),
                const SizedBox(height: 20),
                Text(
                  '24-Hour Forecast',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: report.forecast.length,
                    itemBuilder: (context, index) {
                      final forecast = report.forecast[index];
                      return ListTile(
                        title: Text(forecast.time),
                        subtitle: Text(forecast.condition),
                        trailing: Text(forecast.temperature),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
