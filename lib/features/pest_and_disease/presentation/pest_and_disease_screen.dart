import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/features/pest_and_disease/data/pest_and_disease_datasource.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_repository.dart';
import 'package:myapp/features/pest_and_disease/presentation/pest_and_disease_provider.dart';
import 'package:provider/provider.dart';

class PestAndDiseaseScreen extends StatelessWidget {
  const PestAndDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PestAndDiseaseProvider(
        PestAndDiseaseRepository(
          PestAndDiseaseDatasource(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pest & Disease Identification'),
        ),
        body: Consumer<PestAndDiseaseProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (provider.image != null)
                      Image.file(
                        provider.image!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () =>
                              provider.pickImage(ImageSource.camera),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () =>
                              provider.pickImage(ImageSource.gallery),
                          icon: const Icon(Icons.photo),
                          label: const Text('Gallery'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: provider.image != null
                          ? () => provider.identifyPestOrDisease()
                          : null,
                      child: const Text('Identify'),
                    ),
                    const SizedBox(height: 16.0),
                    if (provider.state == PestAndDiseaseState.loading)
                      const CircularProgressIndicator(),
                    if (provider.state == PestAndDiseaseState.error)
                      Text(
                        'Error: ${provider.errorMessage}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    if (provider.state == PestAndDiseaseState.loaded &&
                        provider.pestAndDisease != null)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.pestAndDisease!.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8.0),
                              Image.network(
                                provider.pestAndDisease!.imageUrl,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(provider.pestAndDisease!.description),
                              const SizedBox(height: 8.0),
                              Text(
                                'Remedy',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(provider.pestAndDisease!.remedy),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
