import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/government_schemes/presentation/government_schemes_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GovernmentSchemesScreen extends ConsumerWidget {
  const GovernmentSchemesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schemesAsync = ref.watch(governmentSchemesProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Schemes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Explore Agricultural Schemes',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Swipe to browse relevant government schemes to support your farming activities.',
                style: textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: schemesAsync.when(
                data: (schemes) => PageView.builder(
                  itemCount: schemes.length,
                  itemBuilder: (context, index) {
                    final scheme = schemes[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: colorScheme.surface,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              scheme.name,
                              style: textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              scheme.description,
                              style: textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Benefits:',
                              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            ...scheme.benefits.map(
                              (benefit) => ListTile(
                                leading: Icon(Icons.check_circle_outline, color: colorScheme.primary),
                                title: Text(benefit),
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  final url = Uri.parse(scheme.url);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: const Text('Learn More'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    'Failed to load schemes: $err',
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
