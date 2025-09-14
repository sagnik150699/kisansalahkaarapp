import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_salahkaar/features/crop_recommendations/presentation/widgets/chat_message.dart';
import 'package:kisan_salahkaar/features/crop_recommendations/presentation/widgets/chat_input.dart';
import 'package:kisan_salahkaar/features/crop_recommendations/presentation/crop_recommendation_provider.dart';

class CropRecommendationScreen extends ConsumerWidget {
  const CropRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Recommendations'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatMessage(
                  text: message.text,
                  isUser: message.isUser,
                );
              },
            ),
          ),
          ChatInput(
            onSendMessage: (message) {
              ref.read(chatProvider.notifier).sendMessage(message);
            },
          ),
        ],
      ),
    );
  }
}
