
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds),
          blendMode: BlendMode.darken,
          child: SafeArea(
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
                  const Spacer(),
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
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
