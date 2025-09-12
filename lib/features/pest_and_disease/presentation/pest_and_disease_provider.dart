import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_model.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_repository.dart';

enum PestAndDiseaseState {
  initial,
  loading,
  loaded,
  error,
}

class PestAndDiseaseProvider with ChangeNotifier {
  final PestAndDiseaseRepository _repository;

  PestAndDiseaseProvider(this._repository);

  PestAndDiseaseState _state = PestAndDiseaseState.initial;
  PestAndDiseaseState get state => _state;

  PestAndDisease? _pestAndDisease;
  PestAndDisease? get pestAndDisease => _pestAndDisease;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  File? _image;
  File? get image => _image;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> identifyPestOrDisease() async {
    if (_image == null) return;

    _state = PestAndDiseaseState.loading;
    notifyListeners();

    try {
      _pestAndDisease = await _repository.identifyPestOrDisease(_image!);
      _state = PestAndDiseaseState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = PestAndDiseaseState.error;
    }

    notifyListeners();
  }
}
