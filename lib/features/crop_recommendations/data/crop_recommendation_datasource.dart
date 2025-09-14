import '../domain/crop_recommendation_model.dart';

class CropRecommendationDatasource {
  Future<CropRecommendation> getRecommendation() async {
    // This is a dummy implementation
    await Future.delayed(const Duration(seconds: 1));
    return CropRecommendation(
      cropName: 'Wheat',
      description: 'A staple crop that grows well in this season.',
      plantingSeason: 'Winter',
      soilType: 'Loamy',
    );
  }
}
