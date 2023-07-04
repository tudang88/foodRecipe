import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/api/api_client.dart';
import '../../../data/repository/food_recipes_repository.dart';
import '../../../presentation/feature/home/models/category_item_model.dart';

part 'get_all_categories.g.dart';

/// provider for all Categories
@Riverpod(keepAlive: true)
Future<List<CategoryItemModel>> allRecipeCategories(
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
              CategoryItemModel.fromGetAllCategory(category: category),
        )
        .toList();
  }
}
