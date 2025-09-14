import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 64.0),
              Text(
                'Kisan Salahkaar',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Your AI companion for smart farming',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 32.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: <Widget>[
                    FeatureCard(
                      title: 'Get Crop Recommendations',
                      icon: Icons.agriculture_outlined,
                      onTap: () => context.go('/crop-recommendations'),
                    ),
                    FeatureCard(
                      title: 'Government Schemes',
                      icon: Icons.account_balance_outlined,
                      onTap: () => context.go('/government-schemes'),
                    ),
                    FeatureCard(
                      title: 'Pest & Disease Identification',
                      icon: Icons.bug_report_outlined,
                      onTap: () => context.go('/pest-and-disease'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
