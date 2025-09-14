import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/government_schemes/data/government_schemes_datasource.dart';
import 'package:myapp/features/government_schemes/domain/government_scheme_model.dart';
import 'package:myapp/features/government_schemes/domain/government_schemes_repository.dart';

final governmentSchemesDatasourceProvider = Provider((ref) => GovernmentSchemesDatasource());

final governmentSchemesRepositoryProvider = Provider<GovernmentSchemesRepository>((ref) {
  final datasource = ref.watch(governmentSchemesDatasourceProvider);
  return GovernmentSchemesRepositoryImpl(datasource: datasource);
});

final governmentSchemesProvider = FutureProvider.autoDispose<List<GovernmentScheme>>((ref) {
  final repository = ref.watch(governmentSchemesRepositoryProvider);
  return repository.getAllSchemes();
});
