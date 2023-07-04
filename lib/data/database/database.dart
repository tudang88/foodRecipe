import 'local_db.dart';

/// Database interface
abstract class Database {
  Stream<List<FavoriteRecipe>> getAllFavorites();
  Future<void> insertFavorite(FavoriteTableEntryCompanion favorite);
  Future<void> deleteFavorite(String recipeId);
  Future<void> deleteAllFavorites();
  Future<bool> isExistedItem(String id);
}
