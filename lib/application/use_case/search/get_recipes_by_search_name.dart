import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/api/api_client.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/repository/food_recipes_repository.dart';
import '../../../presentation/feature/search_page/models/search_recipe_list_item_model.dart';

part 'get_recipes_by_search_name.g.dart';

/// provider expose the gate to search recipe by name
@riverpod
Future<List<SearchRecipeListItemModel>> searchRecipesByName(
  SearchRecipesByNameRef ref, {
  required ApiClient apiClient,
  required FoodRecipesRepository recipesRepository,
}) async {
  final keyword = ref.watch(keywordProvider);
  if (keyword == '') {
    return [];
  }
  final result = await recipesRepository.getAllRecipesByName(
    apiClient: apiClient,
    name: keyword,
  );

  if (result.meals == null) {
    return [];
  } else {
    return result.meals!
        .map(
          (details) => SearchRecipeListItemModel.fromGetRecipesByNameResponse(
            recipeDetails: details,
          ),
        )
        .toList();
  }
}
