import 'package:myapp/features/market_prices/data/market_price_datasource.dart';
import 'package:myapp/features/market_prices/domain/market_price_model.dart';

abstract class MarketPriceRepository {
  Future<List<MarketPrice>> getMarketPrices(String location);
}

class MarketPriceRepositoryImpl implements MarketPriceRepository {
  final MarketPriceDatasource datasource;

  MarketPriceRepositoryImpl({required this.datasource});

  @override
  Future<List<MarketPrice>> getMarketPrices(String location) async {
    return datasource.getMarketPrices(location);
  }
}
