import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_salahkaar/features/crop_recommendations/domain/chat_message_model.dart';

final chatProvider =
    StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier() : super([]);

  final GenerativeModel _model =
      FirebaseAI.googleAI(auth: FirebaseAuth.instance)
          .generativeModel(model: 'gemini-1.5-flash');

  Future<void> sendMessage(String message) async {
    state = [...state, ChatMessage(text: message, isUser: true)];

    final response = await _model.generateContent([Content.text(message)]);

    state = [...state, ChatMessage(text: response.text ?? '', isUser: false)];
  }
}
