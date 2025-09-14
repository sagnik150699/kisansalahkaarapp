import 'package:cloud_functions/cloud_functions.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_repository.dart';

class CropRecommendationDataSource implements CropRecommendationRepository {
  final FirebaseFunctions _functions;

  CropRecommendationDataSource({FirebaseFunctions? functions})
    : _functions = functions ?? FirebaseFunctions.instance;

  @override
  Future<List<CropRecommendation>> getCropRecommendations({
    required String location,
    required String soilType,
    required String weather,
  }) async {
    final HttpsCallable callable = _functions.httpsCallable(
      'getCropRecommendations',
    );
    final HttpsCallableResult result = await callable.call(<String, dynamic>{
      'location': location,
      'soilType': soilType,
      'weather': weather,
    });

    final List<dynamic> data = result.data as List<dynamic>;
    return data.map((item) => CropRecommendation.fromJson(item)).toList();
  }
}
