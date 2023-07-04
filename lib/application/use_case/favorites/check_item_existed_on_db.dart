import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/database/database.dart';
import '../../../data/repository/food_recipes_repository.dart';

part 'check_item_existed_on_db.g.dart';

@riverpod
Future<bool> checkItemExistedOnDb(
  CheckItemExistedOnDbRef ref, {
  required FoodRecipesRepository repository,
  required Database database,
  required String recipeId,
}) async {
  return repository.isExistedItem(database: database, id: recipeId);
}
