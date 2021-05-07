import 'package:app/bloc/repositories/mealrepo.dart';
import 'package:app/models/pojo/mealdetails.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DetailState {
  const DetailState();
}

class DetailInit extends DetailState {
  const DetailInit();
}

class DetailLoading extends DetailState {
  const DetailLoading();
}

class DetailLoadEvent extends DetailState {
  final MealDetails mealDetails;
  const DetailLoadEvent(this.mealDetails);
}

class DetailLoadError extends DetailState {
  final String message;
  const DetailLoadError(this.message);
}

class DetailNotifier extends StateNotifier<DetailState> {
  MealRepo _mealRepo;
  DetailNotifier(this._mealRepo) : super(DetailInit());

  Future<void> backToInit() async {
    state = DetailInit();
  }

  Future? detailMeals(String id) async {
    try {
      state = DetailLoading();
      final result = await _mealRepo.detailMeals(id);
      if (result.idMeal.isNotEmpty) {
        MealDetails mealDetails = result;
        mealDetails.allIngredients!
            .removeWhere((element) => element.item!.trim() == '');
        mealDetails.allMeasure!
            .removeWhere((element) => element.item!.trim() == '');
        state = DetailLoadEvent(result);
      } else {
        state = DetailLoadEvent(MealDetails());
      }
    } catch (e) {
      state = DetailLoadError('error $e');
    }
  }
}
