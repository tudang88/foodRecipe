import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/food_recipes_repository.dart';

part 'food_recipes_repository_provider.g.dart';

/// expose the repository thanks to river_pod provider and generator
///
@riverpod
FoodRecipesRepository foodRecipesRepository(FoodRecipesRepositoryRef ref) {
  return FoodRecipesRepository();
}
