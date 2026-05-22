import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  Future<void> searchRecipes(String query) async {
    _isLoading = true;
    notifyListeners();

    _recipes = await ApiService.searchRecipes(query);

    _isLoading = false;
    notifyListeners();
  }

  List<Recipe> _favorites = [];

List<Recipe> get favorites => _favorites;

bool isFavorite(String id) {
  return _favorites.any((r) => r.id == id);
}

void toggleFavorite(Recipe recipe) {
  if (isFavorite(recipe.id)) {
    _favorites.removeWhere((r) => r.id == recipe.id);
  } else {
    _favorites.add(recipe);
  }
  notifyListeners();
}
}