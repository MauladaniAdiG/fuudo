class MealDetails {
  final String? idMeal;
  final String? mealName;
  final String? category;
  final String? area;
  final String? instruction;
  final String? mealThumb;
  final String? tags;
  final String? youtubeLink;
  final List<AllIngredients>? allIngredients;
  final List<AllMeasure>? allMeasure;

  const MealDetails(
      {this.idMeal,
      this.mealName,
      this.category,
      this.area,
      this.instruction,
      this.mealThumb,
      this.tags,
      this.youtubeLink,
      this.allIngredients,
      this.allMeasure});

  factory MealDetails.fromJson(Map<String, dynamic> parseJson) {
    return MealDetails(
        idMeal: parseJson['idMeal'],
        mealName: parseJson['strMeal'],
        category: parseJson['strCategory'],
        area: parseJson['strArea'],
        instruction: parseJson['strInstructions'],
        mealThumb: parseJson['strMealThumb'],
        tags: parseJson['strTags'],
        youtubeLink: parseJson['strYoutube'],
        allIngredients: mealIngredientList([
          parseJson['strIngredient1'] ?? '',
          parseJson['strIngredient2'] ?? '',
          parseJson['strIngredient3'] ?? '',
          parseJson['strIngredient4'] ?? '',
          parseJson['strIngredient5'] ?? '',
          parseJson['strIngredient6'] ?? '',
          parseJson['strIngredient7'] ?? '',
          parseJson['strIngredient8'] ?? '',
          parseJson['strIngredient9'] ?? '',
          parseJson['strIngredient10'] ?? '',
          parseJson['strIngredient11'] ?? '',
          parseJson['strIngredient12'] ?? '',
          parseJson['strIngredient13'] ?? '',
          parseJson['strIngredient14'] ?? '',
          parseJson['strIngredient15'] ?? '',
          parseJson['strIngredient16'] ?? '',
          parseJson['strIngredient17'] ?? '',
          parseJson['strIngredient18'] ?? '',
          parseJson['strIngredient19'] ?? '',
          parseJson['strIngredient20'] ?? ''
        ]),
        allMeasure: mealMeasureList([
          parseJson['strMeasure1'] ?? '',
          parseJson['strMeasure2'] ?? '',
          parseJson['strMeasure3'] ?? '',
          parseJson['strMeasure4'] ?? '',
          parseJson['strMeasure5'] ?? '',
          parseJson['strMeasure6'] ?? '',
          parseJson['strMeasure7'] ?? '',
          parseJson['strMeasure8'] ?? '',
          parseJson['strMeasure9'] ?? '',
          parseJson['strMeasure10'] ?? '',
          parseJson['strMeasure11'] ?? '',
          parseJson['strMeasure12'] ?? '',
          parseJson['strMeasure13'] ?? '',
          parseJson['strMeasure14'] ?? '',
          parseJson['strMeasure15'] ?? '',
          parseJson['strMeasure16'] ?? '',
          parseJson['strMeasure17'] ?? '',
          parseJson['strMeasure18'] ?? '',
          parseJson['strMeasure19'] ?? '',
          parseJson['strMeasure20'] ?? '',
        ]));
  }
  static List<AllIngredients> mealIngredientList(List json) {
    List<AllIngredients> dumm =
        json.map((e) => AllIngredients.fromJson(e)).toList();
    return dumm;
  }

  static List<AllMeasure> mealMeasureList(List json) {
    List<AllMeasure> dumm = json.map((e) => AllMeasure.fromJson(e)).toList();
    return dumm;
  }
}

class AllIngredients {
  final String? item;
  const AllIngredients({this.item});

  factory AllIngredients.fromJson(String json) {
    return AllIngredients(
      item: json,
    );
  }
}

class AllMeasure {
  final String? item;
  const AllMeasure({this.item});

  factory AllMeasure.fromJson(String json) {
    return AllMeasure(
      item: json,
    );
  }
}
