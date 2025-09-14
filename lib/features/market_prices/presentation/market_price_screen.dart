import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_salahkaar/features/market_prices/presentation/market_price_provider.dart';

class MarketPriceScreen extends ConsumerWidget {
  const MarketPriceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketPrices = ref.watch(marketPriceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices'),
      ),
      body: marketPrices.when(
        data: (prices) {
          return ListView.builder(
            itemCount: prices.length,
            itemBuilder: (context, index) {
              final price = prices[index];
              return ListTile(
                title: Text(price.crop),
                subtitle: Text(price.market),
                trailing: Text(price.price),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
