import 'package:go_router/go_router.dart';
import 'package:kisan_salahkaar/presentation/home_screen.dart';
import 'package:kisan_salahkaar/features/crop_recommendations/presentation/crop_recommendation_screen.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/presentation/pest_and_disease_screen.dart';
import 'package:kisan_salahkaar/features/market_prices/presentation/market_price_screen.dart';
import 'package:kisan_salahkaar/features/weather_report/presentation/weather_report_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/crop-recommendations',
      builder: (context, state) => const CropRecommendationScreen(),
    ),
    GoRoute(
      path: '/pest-and-disease',
      builder: (context, state) => const PestAndDiseaseScreen(),
    ),
    GoRoute(
      path: '/market-prices',
      builder: (context, state) => const MarketPriceScreen(),
    ),
    GoRoute(
      path: '/weather-report',
      builder: (context, state) => const WeatherReportScreen(),
    ),
  ],
);
