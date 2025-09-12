import 'package:myapp/features/government_schemes/data/government_schemes_datasource.dart';
import 'package:myapp/features/government_schemes/domain/government_scheme_model.dart';

class GovernmentSchemesRepository {
  final GovernmentSchemesDatasource _datasource;

  GovernmentSchemesRepository(this._datasource);

  Future<List<GovernmentScheme>> getGovernmentSchemes() {
    return _datasource.getGovernmentSchemes();
  }
}
