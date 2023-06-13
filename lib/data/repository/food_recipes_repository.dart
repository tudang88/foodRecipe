import '../api/api_client.dart';
import '../model/api/response/get_all_categories_response.dart';

class FoodRecipesRepository {
  /// expose to upper layer
  /// get all Categories
  Future<GetAllCategoriesResponse> getAllCategories({
    required ApiClient apiClient,
  }) async {
    return apiClient.getAllCategories();
  }
}
