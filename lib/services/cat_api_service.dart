import 'dart:convert';
import 'package:http/http.dart' as http;

class CatAPIService {
  final _apiKey =
      "live_PF5SVWD7FqyUHttO1P5GOFpqyAZw2u4SggnwnqmIiGlo4AmCTJz8nIDcTxNVOBuT";

  final String _catBreedsUrl = "https://api.thecatapi.com/v1/breeds";
  final String _catSingleUrl = "https://api.thecatapi.com/v1/images/";
  final String _catsByBreedUrl =
      "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=";

  Future<List> getCatBreeds() async {
    var response = await http.get(Uri.parse(_catBreedsUrl), headers: {
      "x-api-key": _apiKey,
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          json.decode(response.body) as List;
      return jsonResponse;
    } else {
      throw Exception('Failed to get cat breeds');
    }
  }

  Future<Map> getCatById(String catId) async {
    var response = await http.get(Uri.parse("$_catSingleUrl$catId"), headers: {
      "x-api-key": _apiKey,
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      throw Exception('Failed to get cat by id');
    }
  }

  Future<List> getCatsByBreed(String breedId) async {
    var response =
        await http.get(Uri.parse("$_catsByBreedUrl$breedId"), headers: {
      "x-api-key": _apiKey,
    });

    if (response.statusCode == 200) {
      var jsonResponse =
          json.decode(response.body) as List<Map<String, dynamic>>;
      return jsonResponse;
    } else {
      throw Exception('Failed to get cats by breed');
    }
  }
}
