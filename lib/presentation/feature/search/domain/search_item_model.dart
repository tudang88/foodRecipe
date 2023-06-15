import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/api/response/get_recipes_by_name_response.dart';

part 'search_item_model.freezed.dart';

@freezed
class SearchResultItemModel with _$SearchResultItemModel {
  const factory SearchResultItemModel({
    required String recipeId,
    required String recipeThumbnail,
    required String recipeCategory,
    required String recipeName,
  }) = _SearchResultItemModel;

  factory SearchResultItemModel.fromGetRecipesByNameResponse({
    required RecipeDetails recipeDetails,
  }) {
    return SearchResultItemModel(
      recipeId: recipeDetails.recipeId!,
      recipeCategory: recipeDetails.categoryName!,
      recipeThumbnail: recipeDetails.recipeThumbLink!,
      recipeName: recipeDetails.recipeName!,
    );
  }
}
