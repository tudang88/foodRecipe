import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/api/api_client.dart';
import '../../../data/repository/food_recipes_repository.dart';
import '../../../presentation/feature/details_screen/models/recipe_detail_item_model.dart';

part 'get_recipe_details.g.dart';

@riverpod
Future<List<RecipeDetailsItemModel>> getRecipeDetails(
  GetRecipeDetailsRef ref, {
  required ApiClient apiClient,
  required FoodRecipesRepository recipesRepository,
  required String id,
}) async {
  final result =
      await recipesRepository.getRecipeById(apiClient: apiClient, recipeId: id);
  if (result.meals == null) {
    return [];
  }
  return result.meals!
      .map(
        (recipeDetails) => RecipeDetailsItemModel.fromGetRecipeDetailResponse(
          recipeDetails: recipeDetails,
        ),
      )
      .toList();
}
