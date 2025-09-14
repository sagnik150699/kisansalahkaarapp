import 'dart:convert';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:myapp/features/crop_recommendations/domain/crop_recommendation_model.dart';

class CropRecommendationDatasource {
  final model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

  Future<CropRecommendation> getRecommendation({
    required String location,
    required String soilType,
    required String weatherPattern,
  }) async {
    try {
      final prompt =
          'Provide a single crop recommendation for the following conditions: '
          'Location: "$location", Soil Type: "$soilType", Weather Pattern: "$weatherPattern". '
          'Return the result as a single valid JSON object with "cropName", "description", "plantingSeason", and "soilType" keys. '
          'For example: {"cropName": "Rice", "description": "Ideal for water-logged conditions.", "plantingSeason": "Monsoon", "soilType": "Clay"}. '
          'Do not include any text outside of the JSON object.';

      final response = await model.generateContent([Content.text(prompt)]);

      if (response.text == null) {
        throw Exception('Failed to get response from Gemini.');
      }

      // Clean the response to ensure it's a valid JSON string
      final cleanedJson = response.text!
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      final Map<String, dynamic> jsonMap = jsonDecode(cleanedJson);

      return CropRecommendation(
        cropName: jsonMap['cropName'],
        description: jsonMap['description'],
        plantingSeason: jsonMap['plantingSeason'],
        soilType: jsonMap['soilType'],
      );
    } catch (e) {
      // In a real app, you would have more robust error handling
      rethrow;
    }
  }
}
