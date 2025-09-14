import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'pest_and_disease_provider.dart';

class PestAndDiseaseScreen extends ConsumerStatefulWidget {
  const PestAndDiseaseScreen({super.key});

  @override
  ConsumerState<PestAndDiseaseScreen> createState() => _PestAndDiseaseScreenState();
}

class _PestAndDiseaseScreenState extends ConsumerState<PestAndDiseaseScreen> {
  Uint8List? _imageData;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = bytes;
      });
      ref.read(pestAndDiseaseProvider.notifier).identifyPestOrDisease(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pestState = ref.watch(pestAndDiseaseProvider);
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
              pestState.when(
                data: (pest) => pest == null
                    ? const SizedBox.shrink()
                    : Card(
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
                      ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    'Failed to identify pest/disease: $err',
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                    textAlign: TextAlign.center,
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
