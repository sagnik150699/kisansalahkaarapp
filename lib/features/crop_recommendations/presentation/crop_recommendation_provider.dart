import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/crop_recommendations/data/crop_recommendation_datasource.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_repository.dart';

// Providers for the user's selections
final locationProvider = StateProvider<String>((ref) => 'Kolkata, West Bengal');
final soilTypeProvider = StateProvider<String>((ref) => 'Alluvial');
final weatherPatternProvider = StateProvider<String>((ref) => 'Tropical Monsoon');

final cropRecommendationDatasourceProvider = Provider((ref) => CropRecommendationDatasource());

final cropRecommendationRepositoryProvider = Provider<CropRecommendationRepository>((ref) {
  final datasource = ref.watch(cropRecommendationDatasourceProvider);
  return CropRecommendationRepositoryImpl(datasource: datasource);
});

final cropRecommendationProvider = FutureProvider.autoDispose<CropRecommendation>((ref) {
  final repository = ref.watch(cropRecommendationRepositoryProvider);
  // Watch the selection providers
  final location = ref.watch(locationProvider);
  final soilType = ref.watch(soilTypeProvider);
  final weatherPattern = ref.watch(weatherPatternProvider);
  
  return repository.getRecommendation(
    location: location,
    soilType: soilType,
    weatherPattern: weatherPattern,
  );
});
