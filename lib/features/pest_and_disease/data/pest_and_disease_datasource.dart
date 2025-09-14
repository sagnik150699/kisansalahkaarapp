import 'dart:io';

import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_model.dart';

class PestAndDiseaseDatasource {
  // TODO: Replace with actual Firebase implementation
  Future<PestAndDisease> identifyPestOrDisease(File image) async {
    return Future.delayed(const Duration(seconds: 2), () {
      return PestAndDisease(
        name: 'Late Blight',
        description: 'A fungal disease that affects potatoes and tomatoes.',
        remedy: 'Apply fungicides and remove infected plants.',
        imageUrl:
            'https://www.gardeningknowhow.com/wp-content/uploads/2021/06/tomato-late-blight.jpg',
      );
    });
  }
}
