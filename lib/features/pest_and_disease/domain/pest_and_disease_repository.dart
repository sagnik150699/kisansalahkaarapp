import 'dart:typed_data';

import 'package:myapp/features/pest_and_disease/data/pest_and_disease_datasource.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_model.dart';

abstract class PestAndDiseaseRepository {
  Future<PestAndDisease> identifyPestOrDisease(Uint8List image);
}

class PestAndDiseaseRepositoryImpl implements PestAndDiseaseRepository {
  final PestAndDiseaseDatasource datasource;

  PestAndDiseaseRepositoryImpl({required this.datasource});

  @override
  Future<PestAndDisease> identifyPestOrDisease(Uint8List image) async {
    return datasource.identifyPestOrDisease(image);
  }
}
