import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../presentation/feature/top_page/domain/panel_item_model.dart';
import '../../api/api_client.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_panel_recipes.g.dart';

@riverpod
Future<List<PanelRecipeItem>> panelRecipes(
  PanelRecipesRef ref, {
  required ApiClient apiClient,
  required FoodRecipesRepository recipesRepository,
}) async {
  late int randomCategoryIndex;
  final categories =
      await recipesRepository.getAllCategories(apiClient: apiClient);
  if (categories.categories == null) {
    return [];
  } else {
    randomCategoryIndex = Random().nextInt(categories.categories!.length);
  }
  final result = await recipesRepository.getAllRecipesOfCategory(
    apiClient: apiClient,
    category: categories.categories![randomCategoryIndex].categoryName!,
  );

  if (result.meals == null) {
    return [];
  } else {
    return result.meals!
        .map(
          (recipeShort) => PanelRecipeItem.fromGetRecipesOfCategoryResponse(
            recipeShortInfo: recipeShort,
          ),
        )
        .toList();
  }
}
