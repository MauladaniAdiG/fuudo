import 'package:app/services/serviceapi.dart';

abstract class MealRepo {
  Future? getMealsByCategories(String text);
  Future? getMealsByAreas(String text);
  Future? getMealsByName(String text);
  Future? detailMeals(String id);
}

class MealRepoFake implements MealRepo {
  @override
  Future? getMealsByCategories(String text) async {
    final result = await ServiceApi().filtByCategories(text);
    return result;
  }

  @override
  Future? getMealsByAreas(String text) async {
    final result = await ServiceApi().filtByAreas(text);
    return result;
  }

  @override
  Future? getMealsByName(String text) async {
    final result = await ServiceApi().filtByName(text);
    return result;
  }

  @override
  Future? detailMeals(String id) async {
    final result = await ServiceApi().detailMeal(id);
    return result;
  }
}
