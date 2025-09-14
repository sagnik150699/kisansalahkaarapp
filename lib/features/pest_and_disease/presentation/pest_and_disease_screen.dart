import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/presentation/widgets/chat_message.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/presentation/widgets/chat_input.dart';
import 'package:kisan_salahkaar/features/pest_and_disease/presentation/pest_and_disease_provider.dart';

class PestAndDiseaseScreen extends ConsumerWidget {
  const PestAndDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(pestAndDiseaseChatProvider);
    final imageFile = ref.watch(imageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest & Disease ID'),
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
          if (imageFile != null)
            Image.file(
              imageFile,
              height: 200,
            ),
          ChatInput(
            onSendMessage: (message) {
              ref
                  .read(pestAndDiseaseChatProvider.notifier)
                  .sendMessage(message, imageFile);
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                ref.read(imageProvider.notifier).state = File(pickedFile.path);
              }
            },
            child: const Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
