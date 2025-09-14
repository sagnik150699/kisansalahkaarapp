import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'government_schemes_provider.dart';

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
                'Find relevant government schemes to support your farming activities.',
                style: textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search for schemes...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) {
                  // TODO: Implement search functionality
                },
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: schemesAsync.when(
                data: (schemes) => ListView.builder(
                  itemCount: schemes.length,
                  itemBuilder: (context, index) {
                    final scheme = schemes[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: colorScheme.surface,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ExpansionTile(
                        title: Text(
                          scheme.name,
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.account_balance, color: colorScheme.primary),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  scheme.description,
                                  style: textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 8,
                                  children: scheme.benefits
                                      .map((benefit) => Chip(
                                            label: Text(benefit),
                                            avatar: Icon(Icons.check_circle_outline, color: colorScheme.primary),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
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
