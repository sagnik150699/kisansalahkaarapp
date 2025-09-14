import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/features/pest_and_disease/data/pest_and_disease_datasource.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_model.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_repository.dart';

class PestAndDiseaseScreen extends StatefulWidget {
  const PestAndDiseaseScreen({super.key});

  @override
  State<PestAndDiseaseScreen> createState() => _PestAndDiseaseScreenState();
}

class _PestAndDiseaseScreenState extends State<PestAndDiseaseScreen> {
  Future<PestAndDisease?>? _pestAndDiseaseFuture;
  Uint8List? _imageData;

  void _diagnose() {
    if (_imageData != null) {
      setState(() {
        final repository = PestAndDiseaseRepositoryImpl(datasource: PestAndDiseaseDatasource());
        _pestAndDiseaseFuture = repository.identifyPestOrDisease(_imageData!);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = bytes;
        // Reset previous diagnosis
        _pestAndDiseaseFuture = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: colorScheme.primary.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pest & Disease ID',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Upload a photo of an affected plant to get a diagnosis.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: _imageData != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.memory(_imageData!, fit: BoxFit.cover),
                  )
                : const Center(child: Text('Image preview')),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.attach_file),
                label: const Text('Choose File'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _imageData != null ? _diagnose : null,
                child: const Text('Diagnose Plant'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (_pestAndDiseaseFuture != null)
            FutureBuilder<PestAndDisease?>(
              future: _pestAndDiseaseFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  final pest = snapshot.data!;
                  return _buildDiagnosisResult(pest, context);
                }
                return const SizedBox.shrink();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildDiagnosisResult(PestAndDisease pest, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Diagnosis
        Text('Diagnosis:', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(pest.description),
        const SizedBox(height: 24),

        // Organic Remedies
        Text('Organic Remedies:', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ...pest.remedies.map((remedy) => ListTile(
              leading: const Icon(Icons.eco),
              title: Text(remedy),
            )),
        const SizedBox(height: 24),
        
        // Inorganic Remedies (Placeholder)
        Text('Inorganic Remedies:', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const ListTile(
          leading: Icon(Icons.science),
          title: Text('Use a fungicide containing Myclobutanil.'),
        ),
        const SizedBox(height: 24),

        // Where to Buy (Placeholder)
        Text('Where to Buy:', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) => 
              Card(
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Expanded(child: Center(child: Text('No Image'))),
                      Text('Product ${index + 1}', overflow: TextOverflow.ellipsis),
                      ElevatedButton(onPressed: (){}, child: const Text('Buy Now'))
                    ],
                  ),
                ),
              )
            ),
          ),
        )
      ],
    );
  }
}
