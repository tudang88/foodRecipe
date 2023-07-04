import '../../domain/model/api/response/get_all_categories_response.dart';
import '../../domain/model/api/response/get_recipes_by_category_response.dart';
import '../../domain/model/api/response/get_recipes_by_name_response.dart';
import '../../presentation/feature/details/models/recipe_detail_item_model.dart';
import '../api/api_client.dart';
import '../database/database.dart';
import '../database/local_db.dart';

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

  /// get all recipes contain keyword
  Future<GetRecipesByNameSearchResponse> getAllRecipesByName({
    required ApiClient apiClient,
    required String name,
  }) async {
    return apiClient.getAllRecipesByName(keyword: name);
  }

  /// get recipe detail base on it Id
  Future<GetRecipeByIdResponse> getRecipeById({
    required ApiClient apiClient,
    required String recipeId,
  }) async {
    return apiClient.getRecipeById(recipeId: recipeId);
  }

  /// get favorite recipes interface
  Stream<List<FavoriteRecipe>> getAllFavorites({
    required Database database,
  }) {
    return database.getAllFavorites();
  }

  /// add item to database
  Future<void> addFavorite({
    required Database database,
    required RecipeDetailsItemModel entry,
  }) async {
    final dbEntry = FavoriteTableEntryCompanion.insert(
      recipeId: entry.recipeId,
      recipeTitle: entry.recipeTitle,
      recipeThumb: entry.recipeThumb,
      recipeCategory: entry.recipeCategory,
      recipeAre: entry.recipeArea,
    );
    await database.insertFavorite(dbEntry);
  }

  /// remove favorite item
  Future<void> removeFavoriteItem({
    required Database database,
    required String recipeId,
  }) async {
    await database.deleteFavorite(recipeId);
  }
}
