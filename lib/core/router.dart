import 'package:go_router/go_router.dart';
import '../presentation/home_screen.dart';
import '../features/crop_recommendations/presentation/crop_recommendation_screen.dart';
import '../features/government_schemes/presentation/government_schemes_screen.dart';
import '../features/pest_and_disease/presentation/pest_and_disease_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/crop-recommendation',
      builder: (context, state) => const CropRecommendationScreen(),
    ),
    GoRoute(
      path: '/government-schemes',
      builder: (context, state) => const GovernmentSchemesScreen(),
    ),
    GoRoute(
      path: '/pest-disease',
      builder: (context, state) => const PestAndDiseaseScreen(),
    ),
  ],
);
