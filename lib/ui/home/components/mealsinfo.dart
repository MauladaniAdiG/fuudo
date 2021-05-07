import 'package:app/bloc/notifiers/mealnotifier.dart';
import 'package:app/bloc/providers.dart';
import 'package:app/ui/detail/detailpage.dart';
import 'package:app/ui/error/errorhelper.dart';
import 'package:app/ui/home/components/searchandmenu.dart';
import 'package:app/util/navigator.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsInfo extends StatefulWidget {
  final String? text;
  const MealsInfo({this.text});
  @override
  _MealsInfoState createState() => _MealsInfoState();
}

class _MealsInfoState extends State<MealsInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer(
      builder: (context, watch, _) {
        final state = watch(mealCategoriesNotifier);
        final searchControllerState = watch(searchNotifier).state;
        if (state is MealInit) {
          Future.delayed(Duration(seconds: 2), () {
            if (state.choosenSearch.isEmpty) {
              context
                  .read(mealCategoriesNotifier.notifier)
                  .getListMealByCategories('beef');
            }
          });
          return Column(
            children: [
              SearchAndMenu(),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextDesign(
                  state.choosenSearch == 'name'
                      ? "Hey, let's search food u need"
                      : 'Please choose menu on the bottom and go searching',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        } else if (state is MealLoading) {
          return Column(
            children: [
              SearchAndMenu(),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        } else if (state is MealLoadEvent) {
          if (state.mealCategories.isNotEmpty) {
            return Column(
              children: [
                SearchAndMenu(
                  mealCategories: state.mealCategories,
                  mealCategoriesAll: state.mealCategoriesAll,
                  mealCategoriesImmut: state.mealCategoriesImmut,
                ),
                Container(
                  height: sHeight(context) * 0.8,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollNotification) {
                      if (scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent) {
                        if (searchControllerState.isEmpty) {
                          context
                              .read(mealCategoriesNotifier.notifier)
                              .moreMealPlease(
                                  state.mealCategories,
                                  state.mealCategoriesAll,
                                  '',
                                  state.mealCategoriesImmut);
                          print('woyss');
                        } else {
                          context
                              .read(mealCategoriesNotifier.notifier)
                              .moreMealPlease(
                                  state.mealCategories,
                                  state.mealCategoriesAll,
                                  searchControllerState,
                                  state.mealCategoriesImmut);
                          print('woys');
                        }
                      }
                      return false;
                    },
                    child: ListView.builder(
                        primary: false,
                        itemCount: state.mealCategories.length,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              pushNav(
                                  context,
                                  DetailPage(
                                      id: state.mealCategories[i].idMeal!),
                                  false);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(300),
                                    child: Image.network(
                                      '${state.mealCategories[i].mealThumb!}',
                                      fit: BoxFit.cover,
                                      cacheWidth: 300,
                                      cacheHeight: 300,
                                      gaplessPlayback: true,
                                    ),
                                  )),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: TextDesign(
                                        state.mealCategories[i].mealName!,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                SearchAndMenu(
                  mealCategories: state.mealCategoriesImmut,
                  mealCategoriesAll: state.mealCategoriesAll,
                  mealCategoriesImmut: state.mealCategoriesImmut,
                ),
                Center(
                  child: TextDesign('Fuudo cannot find ur meals'),
                ),
              ],
            );
          }
        } else if (state is MealLoadError) {
          return ErrorHelper();
        } else {
          return Container();
        }
      },
    ));
  }
}
