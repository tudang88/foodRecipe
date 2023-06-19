import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/database/local_db.dart';

part 'favorite_item_model.freezed.dart';

@freezed
class FavoriteItemModel with _$FavoriteItemModel {
  const factory FavoriteItemModel({
    required String recipeId,
    required String recipeTitle,
    required String recipeThumb,
    required String recipeCategory,
    required String recipeArea,
  }) = _FavoriteItemModel;

  factory FavoriteItemModel.fromDbEntry(FavoriteRecipe dbEntry) {
    return FavoriteItemModel(
      recipeId: dbEntry.recipeId,
      recipeTitle: dbEntry.recipeTitle,
      recipeThumb: dbEntry.recipeThumb,
      recipeCategory: dbEntry.recipeCategory,
      recipeArea: dbEntry.recipeAre,
    );
  }
}
