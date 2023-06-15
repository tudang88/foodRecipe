import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../presentation/feature/search/domain/search_item_model.dart';
import '../../api/api_client.dart';
import '../../providers/common_provider.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_recipes_by_search_name.g.dart';

/// provider expose the gate to search recipe by name
@riverpod
Future<List<SearchResultItemModel>> searchRecipesByName(
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
          (details) => SearchResultItemModel.fromGetRecipesByNameResponse(
            recipeDetails: details,
          ),
        )
        .toList();
  }
}
