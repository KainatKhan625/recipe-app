class Recipe {
  final String id;
  final String name;
  final String image;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });


  factory Recipe.fromJson(Map<String, dynamic> json) {
  return Recipe(
    id: json['idMeal'] ?? '',
    name: json['strMeal'] ?? '',
    image: json['strMealThumb'] ?? '',
    ingredients: _getIngredients(json),
    instructions: json['strInstructions'] ?? '',
  );
}

static List<String> _getIngredients(Map<String, dynamic> json) {
  List<String> ingredients = [];
  for (int i = 1; i <= 20; i++) {
    final ingredient = json['strIngredient$i'];
    final measure = json['strMeasure$i'];
    if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
      ingredients.add('$measure $ingredient'.trim());
    }
  }
  return ingredients;
}
}