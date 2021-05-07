import 'package:app/bloc/notifiers/detailnotifier.dart';
import 'package:app/bloc/notifiers/mealnotifier.dart';
import 'package:app/bloc/repositories/mealrepo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//homepage
final mealCategoriesRepo =
    Provider.autoDispose<MealRepo>((ref) => MealRepoFake());
final mealCategoriesNotifier = StateNotifierProvider.autoDispose(
    (ref) => MealNotifier(ref.watch(mealCategoriesRepo)));
final searchNotifier = StateProvider.autoDispose<String>((ref) => '');
final openBottomMenuNotifier = StateProvider.autoDispose<bool>((ref) => false);
final moreBottomMenuNotifier = StateProvider.autoDispose<int>((ref) => 0);
final bottomMenuNotifier = StateProvider.autoDispose<String>((ref) => 'beef');
final chooseSearchMenuNotifier =
    StateProvider.autoDispose<String>((ref) => 'categories');
final heightMenuNotifier = StateProvider.autoDispose<double>((ref) => 0.0);
final hideMenuNotifier = StateProvider.autoDispose<bool>((ref) => false);

//detail
final detailMealNotifier = StateNotifierProvider.autoDispose(
    (ref) => DetailNotifier(ref.watch(mealCategoriesRepo)));
final readMoreDetailNotifier = StateProvider.autoDispose<bool>((ref) => false);
