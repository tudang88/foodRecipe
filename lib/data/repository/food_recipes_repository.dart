import '../api/api_client.dart';
import '../model/api/response/get_all_categories_response.dart';
import '../model/api/response/get_recipes_by_category_response.dart';

/// expose data to upper layer
class FoodRecipesRepository {
  /// get all Categories
  Future<GetAllCategoriesResponse> getAllCategories({
    required ApiClient apiClient,
  }) async {
    return apiClient.getAllCategories();
  }

  /// get all recipes short description of a category
  Future<GetRecipesByCategoryResponse> getAllRecipesOfCategory({
    required ApiClient apiClient,
    required String category,
  }) async {
    return apiClient.getAllRecipesOfCategory(category: category);
  }
}
