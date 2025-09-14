import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/government_schemes_datasource.dart';
import '../domain/government_scheme_model.dart';
import '../domain/government_schemes_repository.dart';

final governmentSchemesDatasourceProvider = Provider((ref) => GovernmentSchemesDatasource());

final governmentSchemesRepositoryProvider = Provider<GovernmentSchemesRepository>((ref) {
  final datasource = ref.watch(governmentSchemesDatasourceProvider);
  return GovernmentSchemesRepositoryImpl(datasource: datasource);
});

final governmentSchemesProvider = FutureProvider.autoDispose<List<GovernmentScheme>>((ref) {
  final repository = ref.watch(governmentSchemesRepositoryProvider);
  return repository.getAllSchemes();
});
