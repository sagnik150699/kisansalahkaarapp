import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/crop_recommendation_datasource.dart';
import '../domain/crop_recommendation_model.dart';
import '../domain/crop_recommendation_repository.dart';

final cropRecommendationDatasourceProvider = Provider((ref) => CropRecommendationDatasource());

final cropRecommendationRepositoryProvider = Provider<CropRecommendationRepository>((ref) {
  final datasource = ref.watch(cropRecommendationDatasourceProvider);
  return CropRecommendationRepositoryImpl(datasource: datasource);
});

final cropRecommendationProvider = FutureProvider.autoDispose<CropRecommendation>((ref) {
  final repository = ref.watch(cropRecommendationRepositoryProvider);
  return repository.getRecommendation('some_location');
});
