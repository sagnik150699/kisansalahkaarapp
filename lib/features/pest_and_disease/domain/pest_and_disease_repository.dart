import 'dart:typed_data';

import '../data/pest_and_disease_datasource.dart';
import 'pest_and_disease_model.dart';

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
