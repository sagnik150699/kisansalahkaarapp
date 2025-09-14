import '../domain/government_scheme_model.dart';

class GovernmentSchemesDatasource {
  Future<List<GovernmentScheme>> getAllSchemes() async {
    // This is a dummy implementation
    await Future.delayed(const Duration(seconds: 1));
    return [
      GovernmentScheme(
        name: 'PM Kisan Samman Nidhi',
        description: 'A central sector scheme with 100% funding from the Government of India.',
        benefits: ['Income support of Rs. 6,000/- per year', 'Direct bank transfer'],
        url: 'https://pmkisan.gov.in/',
      ),
      GovernmentScheme(
        name: 'Kisan Credit Card',
        description: 'A scheme to provide farmers with timely access to credit.',
        benefits: ['Short-term credit for cultivation', 'Post-harvest expenses'],
        url: 'https://www.sbi.co.in/web/agri-rural/agriculture-banking/crop-finance/kisan-credit-card',
      ),
    ];
  }
}
