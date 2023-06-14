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
  required String category,
}) async {
  final result = await recipesRepository.getAllRecipesOfCategory(
      apiClient: apiClient, category: category);

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