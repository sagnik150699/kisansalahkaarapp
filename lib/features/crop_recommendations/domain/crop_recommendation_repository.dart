import 'package:myapp/features/crop_recommendations/data/crop_recommendation_datasource.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';

abstract class CropRecommendationRepository {
  Future<CropRecommendation> getRecommendation({
    required String location,
    required String soilType,
    required String weatherPattern,
  });
}

class CropRecommendationRepositoryImpl implements CropRecommendationRepository {
  final CropRecommendationDatasource datasource;

  CropRecommendationRepositoryImpl({required this.datasource});

  @override
  Future<CropRecommendation> getRecommendation({
    required String location,
    required String soilType,
    required String weatherPattern,
  }) async {
    return datasource.getRecommendation(
      location: location,
      soilType: soilType,
      weatherPattern: weatherPattern,
    );
  }
}
