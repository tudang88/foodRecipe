import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/api/response/get_recipes_by_category_response.dart';

part 'panel_recipe_list_item_model.freezed.dart';

@freezed
class PanelRecipeListItemModel with _$PanelRecipeListItemModel {
  const factory PanelRecipeListItemModel({
    required String recipeId,
    required String recipeTitle,
    required String recipeThumb,
  }) = _PanelRecipeListItemModel;

  factory PanelRecipeListItemModel.fromGetRecipesOfCategoryResponse({
    required RecipeShortInfo recipeShortInfo,
  }) {
    return PanelRecipeListItemModel(
      recipeId: recipeShortInfo.recipeId!,
      recipeTitle: recipeShortInfo.recipeName!,
      recipeThumb: recipeShortInfo.recipeThumbLink ?? '',
    );
  }
}
