import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_salahkaar/features/market_prices/domain/market_price_model.dart';

final marketPriceProvider = FutureProvider<List<MarketPrice>>((ref) async {
  final model = FirebaseAI.googleAI(auth: FirebaseAuth.instance)
      .generativeModel(model: 'gemini-1.5-flash');

  final response = await model.generateContent([
    Content.text(
        'Get the current market prices for potato, onion, tomato, brinjal, and rice in Kolkata')
  ]);

  final marketPrices = response.text!.split('\n').map((line) {
    final parts = line.split(',');
    return MarketPrice(
      crop: parts[0],
      market: parts[1],
      price: parts[2],
    );
  }).toList();

  return marketPrices;
});
