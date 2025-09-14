import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/domain/pest_and_disease_model.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/domain/pest_and_disease_repository.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/data/pest_and_disease_datasource.dart';

class PestAndDiseaseScreen extends StatefulWidget {
  const PestAndDiseaseScreen({super.key});

  @override
  State<PestAndDiseaseScreen> createState() => _PestAndDiseaseScreenState();
}

class _PestAndDiseaseScreenState extends State<PestAndDiseaseScreen> {
  Future<PestAndDisease?>? _pestAndDiseaseFuture;
  Uint8List? _imageData;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = bytes;
        final repository = PestAndDiseaseRepositoryImpl(datasource: PestAndDiseaseDatasource());
        _pestAndDiseaseFuture = repository.identifyPestOrDisease(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest & Disease Detection'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Identify Crop Issues Instantly',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Upload an image of the affected crop to get an AI-powered analysis.',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.primary, width: 2),
                  ),
                  child: _imageData != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.memory(_imageData!, fit: BoxFit.cover),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload, size: 48, color: colorScheme.primary),
                            const SizedBox(height: 16),
                            Text(
                              'Tap to upload an image',
                              style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 32),
              if (_pestAndDiseaseFuture != null)
                FutureBuilder<PestAndDisease?>(
                  future: _pestAndDiseaseFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Failed to identify pest/disease: ${snapshot.error}',
                          style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final pest = snapshot.data!;
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pest.name,
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(pest.description, style: textTheme.bodyLarge),
                              const SizedBox(height: 24),
                              Text(
                                'Recommended Remedies:',
                                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              ...pest.remedies.map(
                                (remedy) => ListTile(
                                  leading: Icon(Icons.healing, color: colorScheme.primary),
                                  title: Text(remedy),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
