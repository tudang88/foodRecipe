import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/api/response/get_recipes_by_category_response.dart';

part 'panel_item_model.freezed.dart';

@freezed
class PanelRecipeItem with _$PanelRecipeItem {
  const factory PanelRecipeItem({
    required String recipeId,
    required String recipeTitle,
    required String recipeThumb,
  }) = _PanelRecipeItem;

  factory PanelRecipeItem.fromGetRecipesOfCategoryResponse({
    required RecipeShortInfo recipeShortInfo,
  }) {
    return PanelRecipeItem(
      recipeId: recipeShortInfo.recipeId!,
      recipeTitle: recipeShortInfo.recipeName!,
      recipeThumb: recipeShortInfo.recipeThumbLink ?? '',
    );
  }
}
