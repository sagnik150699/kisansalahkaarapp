import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/crop_recommendations/presentation/crop_recommendation_provider.dart';

class CropRecommendationScreen extends ConsumerWidget {
  const CropRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cropRecommendation = ref.watch(cropRecommendationProvider);

    final List<String> locations = [
      'Kolkata, West Bengal',
      'Mumbai, Maharashtra',
      'Chennai, Tamil Nadu'
    ];
    final List<String> soilTypes = ['Alluvial', 'Black', 'Red', 'Laterite'];
    final List<String> weatherPatterns = [
      'Tropical Monsoon',
      'Hot-semiarid',
      'Tropical Wet and Dry'
    ];

    final selectedLocation = ref.watch(locationProvider);
    final selectedSoilType = ref.watch(soilTypeProvider);
    final selectedWeatherPattern = ref.watch(weatherPatternProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Recommendations'),
        backgroundColor: Colors.green.shade900,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Get Crop Recommendations',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildSelectionDropdown(
              context: context,
              label: 'Location',
              value: selectedLocation,
              items: locations,
              onChanged: (value) =>
                  ref.read(locationProvider.notifier).state = value!,
            ),
            const SizedBox(height: 16),
            _buildSelectionDropdown(
              context: context,
              label: 'Soil Type',
              value: selectedSoilType,
              items: soilTypes,
              onChanged: (value) =>
                  ref.read(soilTypeProvider.notifier).state = value!,
            ),
            const SizedBox(height: 16),
            _buildSelectionDropdown(
              context: context,
              label: 'Weather Pattern',
              value: selectedWeatherPattern,
              items: weatherPatterns,
              onChanged: (value) =>
                  ref.read(weatherPatternProvider.notifier).state = value!,
            ),
            const SizedBox(height: 32),
            cropRecommendation.when(
              data: (recommendation) => Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recommendation.cropName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                          icon: Icons.description, text: recommendation.description),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          icon: Icons.wb_sunny,
                          text: 'Planting Season: ${recommendation.plantingSeason}'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          icon: Icons.terrain, text: 'Soil Type: ${recommendation.soilType}'),
                    ],
                  ),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Error: ${error.toString()}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionDropdown({
    required BuildContext context,
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      initialValue: value,
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: Colors.green.shade700, size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
