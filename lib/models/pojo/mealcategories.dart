class MealCategories {
  final String? mealName;
  final String? mealThumb;
  final String? idMeal;
  const MealCategories({this.mealName, this.mealThumb, this.idMeal});

  factory MealCategories.fromJson(Map<String, dynamic> parseJson) {
    return MealCategories(
        mealName: parseJson['strMeal'],
        mealThumb: parseJson['strMealThumb'],
        idMeal: parseJson['idMeal']);
  }
  static List<MealCategories> mealCategoriesList(json) {
    var list = json as List;
    List<MealCategories> data =
        list.map((e) => MealCategories.fromJson(e)).toList();
    return data;
  }
}
