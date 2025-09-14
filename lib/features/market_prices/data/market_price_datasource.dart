import 'dart:convert';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:myapp/features/market_prices/domain/market_price_model.dart';

class MarketPriceDatasource {
  final model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

  Future<List<MarketPrice>> getMarketPrices(String location) async {
    try {
      final prompt =
          'Provide a list of current market prices for the top 5 common agricultural crops in the "$location" area. '
          'Return the result as a valid JSON array where each object has "crop", "market", and "price" keys. '
          'For example: [{"crop": "Potato", "market": "Sealdah Market", "price": "₹25/kg"}]. Do not include any text outside of the JSON array.';

      final response = await model.generateContent([Content.text(prompt)]);

      if (response.text == null) {
        throw Exception('Failed to get response from Gemini.');
      }

      // Clean the response to ensure it's a valid JSON string
      final cleanedJson = response.text!
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      final List<dynamic> jsonList = jsonDecode(cleanedJson);

      return jsonList
          .map((json) => MarketPrice(
                crop: json['crop'],
                market: json['market'],
                price: json['price'],
              ))
          .toList();
    } catch (e) {
      // In a real app, you would have more robust error handling
      rethrow;
    }
  }
}
