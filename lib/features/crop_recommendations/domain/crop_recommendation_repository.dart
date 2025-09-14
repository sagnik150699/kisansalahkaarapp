import '../data/crop_recommendation_datasource.dart';
import 'crop_recommendation_model.dart';

abstract class CropRecommendationRepository {
  Future<CropRecommendation> getRecommendation(String location);
}

class CropRecommendationRepositoryImpl implements CropRecommendationRepository {
  final CropRecommendationDatasource datasource;

  CropRecommendationRepositoryImpl({required this.datasource});

  @override
  Future<CropRecommendation> getRecommendation(String location) async {
    // In a real app, you'd use the location to fetch data
    return datasource.getRecommendation();
  }
}
