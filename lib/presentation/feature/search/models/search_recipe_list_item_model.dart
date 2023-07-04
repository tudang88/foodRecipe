import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/api/response/get_recipes_by_name_response.dart';

part 'search_recipe_list_item_model.freezed.dart';

@freezed
class SearchRecipeListItemModel with _$SearchRecipeListItemModel {
  const factory SearchRecipeListItemModel({
    required String recipeId,
    required String recipeThumbnail,
    required String recipeCategory,
    required String recipeName,
  }) = _SearchRecipeListItemModel;

  factory SearchRecipeListItemModel.fromGetRecipesByNameResponse({
    required RecipeDetails recipeDetails,
  }) {
    return SearchRecipeListItemModel(
      recipeId: recipeDetails.recipeId!,
      recipeCategory: recipeDetails.categoryName!,
      recipeThumbnail: recipeDetails.recipeThumbLink!,
      recipeName: recipeDetails.recipeName!,
    );
  }
}
