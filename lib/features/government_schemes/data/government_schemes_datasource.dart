import 'package:myapp/features/government_schemes/domain/government_scheme_model.dart';

class GovernmentSchemesDatasource {
  // TODO: Replace with actual Firebase implementation
  Future<List<GovernmentScheme>> getGovernmentSchemes() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        GovernmentScheme(
          name: 'Pradhan Mantri Kisan Samman Nidhi',
          description:
              'An income support scheme for small and marginal farmers.',
          url: 'https://pmkisan.gov.in/',
        ),
        GovernmentScheme(
          name: 'Pradhan Mantri Fasal Bima Yojana',
          description:
              'A crop insurance scheme to protect against crop failure.',
          url: 'https://pmfby.gov.in/',
        ),
        GovernmentScheme(
          name: 'Kisan Credit Card',
          description:
              'A credit scheme to provide affordable credit for farmers.',
          url:
              'https://www.sbi.co.in/web/agri-rural/agriculture-banking/crop-finance/kisan-credit-card',
        ),
      ];
    });
  }
}
