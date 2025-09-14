import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/features/market_prices/data/market_price_datasource.dart';
import 'package:myapp/features/market_prices/domain/market_price_model.dart';
import 'package:myapp/features/market_prices/domain/market_price_repository.dart';

// Provider for the user's location selection
final locationProvider = StateProvider<String>((ref) => 'Kolkata, West Bengal');

final marketPriceDatasourceProvider = Provider((ref) => MarketPriceDatasource());

final marketPriceRepositoryProvider = Provider<MarketPriceRepository>((ref) {
  final datasource = ref.watch(marketPriceDatasourceProvider);
  return MarketPriceRepositoryImpl(datasource: datasource);
});

final marketPriceProvider = FutureProvider.autoDispose<List<MarketPrice>>((ref) {
  final repository = ref.watch(marketPriceRepositoryProvider);
  final location = ref.watch(locationProvider);
  
  return repository.getMarketPrices(location);
});
