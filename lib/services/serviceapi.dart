import 'dart:convert';

import 'package:app/models/pojo/mealcategories.dart';
import 'package:app/models/pojo/mealdetails.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future? filtByCategories(String text) async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/filter.php?c=$text'));
    if (response.statusCode == 200) {
      if (json.decode(response.body)['meals'] == null) {
        return null;
      } else {
        return MealCategories.mealCategoriesList(
            json.decode(response.body)['meals']);
      }
    } else {
      return null;
    }
  }

  Future? filtByAreas(String text) async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/filter.php?a=$text'));
    if (response.statusCode == 200) {
      if (json.decode(response.body)['meals'] == null) {
        return null;
      } else {
        return MealCategories.mealCategoriesList(
            json.decode(response.body)['meals']);
      }
    } else {
      return null;
    }
  }

  Future? filtByName(String text) async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/search.php?s=$text'));
    if (response.statusCode == 200) {
      if (json.decode(response.body)['meals'] == null) {
        return null;
      } else {
        return MealCategories.mealCategoriesList(
            json.decode(response.body)['meals']);
      }
    } else {
      return null;
    }
  }

  Future? detailMeal(String id) async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      if (json.decode(response.body)['meals'] == null) {
        return null;
      } else {
        return MealDetails.fromJson(json.decode(response.body)['meals'][0]);
      }
    } else {
      return null;
    }
  }
}
