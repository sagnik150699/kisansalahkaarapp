import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'crop_recommendation_provider.dart';

class CropRecommendationScreen extends ConsumerWidget {
  const CropRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationAsync = ref.watch(cropRecommendationProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Advisor'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get Smart Crop Recommendations',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your location and soil type to get AI-powered crop suggestions.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Location (e.g., "Delhi, India")',
                  prefixIcon: Icon(Icons.location_on),
                ),
                onSubmitted: (location) {
                  // For now, we are not using the location to fetch recommendations
                  // In a real app, this would trigger a new recommendation fetch
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(cropRecommendationProvider);
                  },
                  child: const Text('Get Recommendation'),
                ),
              ),
              const SizedBox(height: 32),
              recommendationAsync.when(
                data: (recommendation) => Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: colorScheme.surface,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recommendation.cropName,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          recommendation.description,
                          style: textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 16,
                          runSpacing: 8,
                          children: [
                            Chip(
                              label: Text('Soil: ${recommendation.soilType}'),
                              avatar: const Icon(Icons.landscape),
                            ),
                            Chip(
                              label: Text('Season: ${recommendation.plantingSeason}'),
                              avatar: const Icon(Icons.thermostat),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    'Failed to get recommendation: $err',
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
