import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:kisan_salahkaar/presentation/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Kisan Salahkaar',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: const [
                      FeatureCard(
                        icon: LucideIcons.leaf,
                        title: 'Crop Recommendations',
                        route: '/crop-recommendations',
                        color: Colors.green,
                      ),
                      FeatureCard(
                        icon: LucideIcons.bug,
                        title: 'Pest & Disease ID',
                        route: '/pest-and-disease',
                        color: Colors.red,
                      ),
                      FeatureCard(
                        icon: LucideIcons.trendingUp,
                        title: 'Market Prices',
                        route: '/market-prices',
                        color: Colors.orange,
                      ),
                      FeatureCard(
                        icon: LucideIcons.cloudSun,
                        title: 'Weather Report',
                        route: '/weather-report',
                        color: Colors.blue,
                      ),
                      FeatureCard(
                        icon: LucideIcons.building,
                        title: 'Government Schemes',
                        route: '/government-schemes',
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
