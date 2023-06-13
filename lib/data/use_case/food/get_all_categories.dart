import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../presentation/feature/news/models/top_anime_item_model.dart';
import '../../api/api_client.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_all_categories.g.dart';

/// provider for all Categories
@riverpod
Future<List<TopAnimeItemModel>> allRecipeCategories(
  AllRecipeCategoriesRef ref, {
  required ApiClient apiClient,
  required FoodRecipesRepository recipesRepository,
}) async {
  final result = await recipesRepository.getAllCategories(apiClient: apiClient);
  if (result.categories == null) {
    return [];
  } else {
    return result.categories!
        .map(
          (category) =>
              TopAnimeItemModel.fromGetAllCategory(category: category),
        )
        .toList();
  }
}
