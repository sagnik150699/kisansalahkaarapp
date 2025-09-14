import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_salahkaar/features/weather_report/domain/weather_report_model.dart';

final weatherReportProvider = FutureProvider<WeatherReport>((ref) async {
  final model = FirebaseAI.googleAI(auth: FirebaseAuth.instance)
      .generativeModel(model: 'gemini-1.5-flash');

  final response = await model.generateContent([
    Content.text('Get the current weather and a 24-hour forecast for Kolkata')
  ]);

  final lines = response.text!.split('\n');
  final currentWeather = lines.sublist(0, 3);
  final forecast = lines.sublist(4);

  return WeatherReport(
    temperature: currentWeather[0],
    humidity: currentWeather[1],
    wind: currentWeather[2],
    forecast: forecast.map((line) {
      final parts = line.split(',');
      return Forecast(
        time: parts[0],
        condition: parts[1],
        temperature: parts[2],
      );
    }).toList(),
  );
});
