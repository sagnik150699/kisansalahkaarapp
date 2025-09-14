import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/domain/chat_message_model.dart';

final pestAndDiseaseChatProvider =
    StateNotifierProvider<PestAndDiseaseChatNotifier, List<ChatMessage>>((ref) {
  return PestAndDiseaseChatNotifier();
});

final imageProvider = StateProvider<File?>((ref) => null);

class PestAndDiseaseChatNotifier extends StateNotifier<List<ChatMessage>> {
  PestAndDiseaseChatNotifier() : super([]);

  final GenerativeModel _model = FirebaseAI.googleAI(auth: FirebaseAuth.instance)
      .generativeModel(model: 'gemini-1.5-pro');

  Future<void> sendMessage(String message, File? imageFile) async {
    try {
      state = [...state, ChatMessage(text: message, isUser: true)];

      if (imageFile != null) {
        final imageBytes = await imageFile.readAsBytes();
        final content = _buildContent(message, imageBytes);
        final response = await _model.generateContent(content);
        state = [...state, ChatMessage(text: response.text ?? '', isUser: false)];
      } else {
        final response = await _model.generateContent([Content.text(message)]);
        state = [...state, ChatMessage(text: response.text ?? '', isUser: false)];
      }
    } catch (e) {
      state = [...state, ChatMessage(text: 'Error: $e', isUser: false)];
    }
  }

  List<Content> _buildContent(String message, Uint8List imageBytes) {
    return [
      Content.multi([
        TextPart(message),
        InlineDataPart('image/jpeg', imageBytes),
      ])
    ];
  }
}
