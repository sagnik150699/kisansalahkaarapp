import 'package:myapp/features/government_schemes/data/government_schemes_datasource.dart';
import 'package:myapp/features/government_schemes/domain/government_scheme_model.dart';

abstract class GovernmentSchemesRepository {
  Future<List<GovernmentScheme>> getAllSchemes();
}

class GovernmentSchemesRepositoryImpl implements GovernmentSchemesRepository {
  final GovernmentSchemesDatasource datasource;

  GovernmentSchemesRepositoryImpl({required this.datasource});

  @override
  Future<List<GovernmentScheme>> getAllSchemes() async {
    return datasource.getAllSchemes();
  }
}
