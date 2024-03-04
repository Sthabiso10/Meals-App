import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../models/meal.dart';

class FavouritMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => meal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesMealProvider =
    StateNotifierProvider<FavouritMealsNotifier, List<Meal>>((ref) {
  return FavouritMealsNotifier();
});
