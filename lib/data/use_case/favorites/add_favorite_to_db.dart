import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../presentation/feature/details/domain/recipe_detail_item_model.dart';
import '../../database/database.dart';
import '../../repository/food_recipes_repository.dart';

part 'add_favorite_to_db.g.dart';

@riverpod
Future<void> addFavoriteItemToDb(
  AddFavoriteItemToDbRef ref, {
  required Database database,
  required FoodRecipesRepository repository,
  required RecipeDetailsItemModel recipe,
}) async {
  await repository.addFavorite(database: database, entry: recipe);
}
