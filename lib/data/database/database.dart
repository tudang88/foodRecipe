import 'local_db.dart';

/// Database interface
abstract class Database {
  Future<List<FavoriteRecipe>> getAllFavorites();
  Future<void> insertFavorite(FavoriteTableEntryCompanion favorite);
  Future<void> deleteFavorite(String recipeId);
  Future<void> deleteAllFavorites();
}
