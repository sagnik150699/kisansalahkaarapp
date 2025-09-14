import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/pest_and_disease_model.dart';
import '../domain/pest_and_disease_repository.dart';
import '../data/pest_and_disease_datasource.dart';

final pestAndDiseaseDatasourceProvider = Provider((ref) => PestAndDiseaseDatasource());

final pestAndDiseaseRepositoryProvider = Provider<PestAndDiseaseRepository>((ref) {
  final datasource = ref.watch(pestAndDiseaseDatasourceProvider);
  return PestAndDiseaseRepositoryImpl(datasource: datasource);
});

final pestAndDiseaseProvider = StateNotifierProvider.autoDispose<PestAndDiseaseNotifier, AsyncValue<PestAndDisease?>>((ref) {
  final repository = ref.watch(pestAndDiseaseRepositoryProvider);
  return PestAndDiseaseNotifier(repository);
});

class PestAndDiseaseNotifier extends StateNotifier<AsyncValue<PestAndDisease?>> {
  final PestAndDiseaseRepository _repository;

  PestAndDiseaseNotifier(this._repository) : super(const AsyncData(null));

  Future<void> identifyPestOrDisease(Uint8List image) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.identifyPestOrDisease(image);
      state = AsyncValue.data(result);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
