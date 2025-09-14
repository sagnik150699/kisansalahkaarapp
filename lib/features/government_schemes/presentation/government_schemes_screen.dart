import 'package:flutter/material.dart';
import 'package:myapp/features/government_schemes/domain/government_schemes_repository.dart';
import 'package:myapp/features/government_schemes/presentation/government_schemes_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/government_schemes_datasource.dart';

class GovernmentSchemesScreen extends StatefulWidget {
  const GovernmentSchemesScreen({super.key});

  @override
  State<GovernmentSchemesScreen> createState() =>
      _GovernmentSchemesScreenState();
}

class _GovernmentSchemesScreenState extends State<GovernmentSchemesScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GovernmentSchemesProvider(
        GovernmentSchemesRepository(GovernmentSchemesDatasource()),
      )..getGovernmentSchemes(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Government Schemes')),
        body: Consumer<GovernmentSchemesProvider>(
          builder: (context, provider, child) {
            if (provider.state == GovernmentSchemesState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.state == GovernmentSchemesState.error) {
              return Center(
                child: Text(
                  'Error: ${provider.errorMessage}',
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView.builder(
              itemCount: provider.schemes.length,
              itemBuilder: (context, index) {
                final scheme = provider.schemes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    title: Text(scheme.name),
                    subtitle: Text(scheme.description),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      final Uri url = Uri.parse(scheme.url);
                      // Capture the context-dependent object before the async gap.
                      final scaffoldMessenger = ScaffoldMessenger.of(context);

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        if (!mounted) return;
                        scaffoldMessenger.showSnackBar(
                          const SnackBar(content: Text('Could not launch URL')),
                        );
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
