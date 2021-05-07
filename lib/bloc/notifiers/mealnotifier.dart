import 'package:app/bloc/repositories/mealrepo.dart';
import 'package:app/models/pojo/mealcategories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MealState {
  const MealState();
}

class MealInit extends MealState {
  final String choosenSearch;
  const MealInit(this.choosenSearch);
}

class MealLoading extends MealState {
  const MealLoading();
}

class MealLoadEvent extends MealState {
  final List<MealCategories> mealCategories;
  final List<MealCategories> mealCategoriesAll;
  final List<MealCategories> mealCategoriesImmut;
  const MealLoadEvent(
      this.mealCategories, this.mealCategoriesAll, this.mealCategoriesImmut);
}

class MealLoadError extends MealState {
  final String errorMessage;
  const MealLoadError(this.errorMessage);
}

class MealNotifier extends StateNotifier<MealState> {
  MealRepo _mealRepo;
  MealNotifier(this._mealRepo) : super(MealInit(''));

  Future<void> toTheInit(String choosen) async {
    state = MealInit(choosen);
  }

  Future? getListMealByCategories(String text) async {
    try {
      state = MealLoading();
      final result = await _mealRepo.getMealsByCategories(text);
      if (result != null) {
        List<MealCategories> list = List.from(result);
        if (list.length > 20) {
          state = MealLoadEvent(list.getRange(0, 20).toList(), result,
              list.getRange(0, 20).toList());
        } else {
          state = MealLoadEvent(list, result, list);
        }
      } else {
        state = MealLoadEvent([], [], []);
      }
    } catch (e) {
      state = MealLoadError('send error message: $e');
    }
  }

  Future? getListMealByAreas(String text) async {
    try {
      state = MealLoading();
      final result = await _mealRepo.getMealsByAreas(text);
      if (result != null) {
        List<MealCategories> list = List.from(result);
        if (list.length > 20) {
          state = MealLoadEvent(list.getRange(0, 20).toList(), result,
              list.getRange(0, 20).toList());
        } else {
          state = MealLoadEvent(list, result, list);
        }
      } else {
        state = MealLoadEvent([], [], []);
      }
    } catch (e) {
      state = MealLoadError('send error message: $e');
    }
  }

  Future? getListMealByName(String text) async {
    try {
      state = MealLoading();
      final result = await _mealRepo.getMealsByName(text);
      if (result != null) {
        List<MealCategories> list = List.from(result);
        if (list.length > 20) {
          state = MealLoadEvent(list.getRange(0, 20).toList(), result,
              list.getRange(0, 20).toList());
        } else {
          state = MealLoadEvent(list, result, list);
        }
      } else {
        state = MealLoadEvent([], [], []);
      }
    } catch (e) {
      state = MealLoadError('send error message: $e');
    }
  }

  Future? moreMealPlease(
      List<MealCategories> mealCategories,
      List<MealCategories> mealCategoriesAll,
      String text,
      List<MealCategories> mealCategoriesImmut) async {
    if (mealCategories.length != mealCategoriesAll.length) {
      if (mealCategories.length + 20 == mealCategoriesAll.length) {
        List<MealCategories> list = [];
        List<MealCategories> dummy = [];

        if (text.isEmpty) {
          for (int i = mealCategories.length;
              i < mealCategoriesAll.length;
              i++) {
            list.add(mealCategoriesAll[i]);
          }
          dummy..addAll(mealCategories)..addAll(list);
          state = MealLoadEvent(dummy, mealCategoriesAll, dummy);
        } else {
          List<MealCategories> anotherList = mealCategories
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          List<MealCategories> dum = List.from(mealCategoriesAll);
          List<MealCategories> anotherListAll = dum
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          for (int i = anotherList.length; i < anotherListAll.length; i++) {
            list.add(anotherListAll[i]);
          }
          dummy..addAll(anotherList)..addAll(list);

          state = MealLoadEvent(dummy, mealCategoriesAll, mealCategoriesImmut);
        }
      } else {
        List<MealCategories> list = [];
        List<MealCategories> dummy = [];

        if (text.isEmpty) {
          for (int i = mealCategories.length;
              i <
                  (mealCategories.length + 20 == mealCategoriesAll.length
                      ? mealCategories.length + 20
                      : mealCategoriesAll.length);
              i++) {
            list.add(mealCategoriesAll[i]);
          }
          dummy..addAll(mealCategories)..addAll(list);
          state = MealLoadEvent(dummy, mealCategoriesAll, dummy);
        } else {
          List<MealCategories> anotherList = mealCategories
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          List<MealCategories> dum = List.from(mealCategoriesAll);
          List<MealCategories> anotherListAll = dum
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          for (int i = anotherList.length;
              i <
                  (anotherList.length + 20 == anotherListAll.length
                      ? anotherList.length + 20
                      : anotherListAll.length);
              i++) {
            list.add(anotherListAll[i]);
          }
          dummy..addAll(anotherList)..addAll(list);
          state = MealLoadEvent(dummy, mealCategoriesAll, mealCategoriesImmut);
        }
      }
    }
  }

  Future? mealSearch(
      List<MealCategories> mealCategories,
      List<MealCategories> mealCategoriesAll,
      List<MealCategories> mealCategoriesImmut,
      String text) async {
    if (mealCategories.isNotEmpty) {
      if (text.isEmpty) {
        state = MealLoadEvent(
            mealCategoriesImmut, mealCategoriesAll, mealCategoriesImmut);
      } else {
        if (mealCategories.length != mealCategoriesImmut.length) {
          List<MealCategories> dummy = [];
          dummy = mealCategoriesImmut
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          state = MealLoadEvent(dummy, mealCategoriesAll, mealCategoriesImmut);
        } else {
          List<MealCategories> dummy = [];
          dummy = mealCategories
              .where((element) =>
                  element.mealName!.toLowerCase().contains(text.toLowerCase()))
              .toList();
          state = MealLoadEvent(dummy, mealCategoriesAll, mealCategoriesImmut);
        }
      }
    }
  }
}
