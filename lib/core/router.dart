import 'package:go_router/go_router.dart';
import 'package:myapp/features/crop_recommendations/presentation/crop_recommendation_screen.dart';
import 'package:myapp/features/government_schemes/presentation/government_schemes_screen.dart';
import 'package:myapp/features/pest_and_disease/presentation/pest_and_disease_screen.dart';
import 'package:myapp/presentation/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/crop-recommendations',
      builder: (context, state) => const CropRecommendationScreen(),
    ),
    GoRoute(
      path: '/government-schemes',
      builder: (context, state) => const GovernmentSchemesScreen(),
    ),
    GoRoute(
      path: '/pest-and-disease',
      builder: (context, state) => const PestAndDiseaseScreen(),
    ),
  ],
);
