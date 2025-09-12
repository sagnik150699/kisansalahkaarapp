import 'dart:io';

import 'package:myapp/features/pest_and_disease/data/pest_and_disease_datasource.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_model.dart';

class PestAndDiseaseRepository {
  final PestAndDiseaseDatasource _datasource;

  PestAndDiseaseRepository(this._datasource);

  Future<PestAndDisease> identifyPestOrDisease(File image) {
    return _datasource.identifyPestOrDisease(image);
  }
}
