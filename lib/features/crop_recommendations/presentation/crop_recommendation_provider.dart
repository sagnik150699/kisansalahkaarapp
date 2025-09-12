import 'package:flutter/material.dart';
import 'package:myapp/features/crop_recommendations/data/crop_recommendation_datasource.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_repository.dart';

class CropRecommendationProvider with ChangeNotifier {
  final CropRecommendationRepository _repository;

  CropRecommendationProvider({CropRecommendationRepository? repository})
      : _repository = repository ?? CropRecommendationDataSource();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CropRecommendation> _recommendations = [];
  List<CropRecommendation> get recommendations => _recommendations;

  String? _error;
  String? get error => _error;

  Future<void> fetchRecommendations({
    required String location,
    required String soilType,
    required String weather,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _recommendations = await _repository.getCropRecommendations(
        location: location,
        soilType: soilType,
        weather: weather,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
