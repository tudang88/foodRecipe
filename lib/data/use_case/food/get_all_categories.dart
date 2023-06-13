import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../presentation/feature/top_page/domain/category_item_model.dart';
import '../../api/api_client.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_all_categories.g.dart';

/// provider for all Categories
@riverpod
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
