import 'package:flutter/material.dart';
import 'package:myapp/features/government_schemes/domain/government_scheme_model.dart';
import 'package:myapp/features/government_schemes/domain/government_schemes_repository.dart';

enum GovernmentSchemesState {
  initial,
  loading,
  loaded,
  error,
}

class GovernmentSchemesProvider with ChangeNotifier {
  final GovernmentSchemesRepository _repository;

  GovernmentSchemesProvider(this._repository);

  GovernmentSchemesState _state = GovernmentSchemesState.initial;
  GovernmentSchemesState get state => _state;

  List<GovernmentScheme> _schemes = [];
  List<GovernmentScheme> get schemes => _schemes;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> getGovernmentSchemes() async {
    _state = GovernmentSchemesState.loading;
    notifyListeners();

    try {
      _schemes = await _repository.getGovernmentSchemes();
      _state = GovernmentSchemesState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = GovernmentSchemesState.error;
    }

    notifyListeners();
  }
}
