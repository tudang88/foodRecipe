import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_case/favorites/check_item_existed_on_db.dart';
import 'database_provider.dart';
import 'food_recipes_repository_provider.dart';

/// a shared variable maintain search keyword
final keywordProvider = StateProvider<String>((ref) => '');

/// a shared variable maintain current tab index
final currentTabProvider = StateProvider<int>((ref) => 0);

final favoriteStatusProvider =
    StateProvider.autoDispose.family<bool, String>((ref, id) {
  // check the recipe is already existed in database or not
  final database = ref.watch(favoriteDbProvider);
  final repository = ref.watch(foodRecipesRepositoryProvider);
  final checkFavoriteDb = ref.watch(
    checkItemExistedOnDbProvider(
      database: database,
      repository: repository,
      recipeId: id,
    ),
  );
  final favoriteInitFlag = checkFavoriteDb.when(
    data: (st) => st,
    error: (e, r) => false,
    loading: () => false,
  );
  return favoriteInitFlag;
});
