import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';

abstract class CropRecommendationRepository {
  Future<List<CropRecommendation>> getCropRecommendations({
    required String location,
    required String soilType,
    required String weather,
  });
}
