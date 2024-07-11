// ignore_for_file: avoid_print

import 'package:cat_break/models/catbreed_model.dart';
import 'package:cat_break/services/cat_api_service.dart';
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  final CatAPIService _apiService = CatAPIService();
  List<CatBreed> _catBreeds = [];
  List<dynamic> _catsByBreed = [];

  List<CatBreed> get catBreeds => _catBreeds;
  List<dynamic> get catsByBreed => _catsByBreed;

  Future<void> fetchCatBreeds() async {
    try {
      print("Fetching cat breeds...");
      final List<dynamic> breedsJson = await _apiService.getCatBreeds();
      _catBreeds = breedsJson.map((json) => CatBreed.fromJson(json)).toList();
      print("Fetched ${_catBreeds.length} cat breeds.");
      notifyListeners();
    } catch (e) {
      print("Error fetching cat breeds: $e");
      throw Exception("Couldn't fetch cat breeds in provider");
    }
  }

  Future<void> fetchCatsByBreed(String breedId) async {
    try {
      print("Fetching cats by breed with ID: $breedId...");
      final catsJson = await _apiService.getCatsByBreed(breedId);
      _catsByBreed = catsJson;
      print("Fetched ${_catsByBreed.length} cats for breed ID: $breedId.");
      notifyListeners();
    } catch (e) {
      print("Error fetching cats by breed: $e");
      throw Exception("Couldn't fetch cats by breed in provider");
    }
  }
}
