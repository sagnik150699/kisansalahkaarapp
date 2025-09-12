import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            color: const Color.fromARGB(128, 0, 0, 0),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Kisan Salahkaar',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Your AI companion for smart farming',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const SizedBox(height: 48.0),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.agriculture_outlined),
                    onPressed: () => context.go('/crop-recommendations'),
                    label: const Text('Get Crop Recommendations'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.account_balance_outlined),
                    onPressed: () => context.go('/government-schemes'),
                    label: const Text('Government Schemes'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.bug_report_outlined),
                    onPressed: () => context.go('/pest-and-disease'),
                    label: const Text('Pest & Disease Identification'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
