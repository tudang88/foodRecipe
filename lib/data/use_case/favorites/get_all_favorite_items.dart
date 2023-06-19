import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../presentation/feature/favorite/domain/favorite_item_model.dart';
import '../../database/database.dart';
import '../../repository/food_recipes_repository.dart';

part 'get_all_favorite_items.g.dart';

@riverpod
Future<List<FavoriteItemModel>> getAllFavoriteItems(
  GetAllFavoriteItemsRef ref, {
  required Database database,
  required FoodRecipesRepository repository,
}) async {
  final result = await repository.getAllFavorites(database: database);
  if (result.isEmpty) {
    return [];
  } else {
    return result
        .map((favoriteEntry) => FavoriteItemModel.fromDbEntry(favoriteEntry))
        .toList();
  }
}
