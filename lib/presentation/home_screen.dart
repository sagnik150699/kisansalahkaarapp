import 'package:flutter/material.dart';
import 'package:myapp/features/crop_recommendations/presentation/crop_recommendation_screen.dart';
import 'package:myapp/features/market_prices/presentation/market_price_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agri-Assistant'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CropRecommendationScreen()),
                );
              },
              child: const Text('Get Crop Recommendations'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MarketPriceScreen()),
                );
              },
              child: const Text('View Market Prices'),
            ),
          ],
        ),
      ),
    );
  }
}
