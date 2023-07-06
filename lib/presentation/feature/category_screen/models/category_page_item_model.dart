import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/api/response/get_recipes_by_category_response.dart';

part 'category_page_item_model.freezed.dart';

@freezed
class CategoryPageItemModel with _$CategoryPageItemModel {
  const factory CategoryPageItemModel({
    required String recipeName,
    required String recipeThumb,
    required String recipeId,
  }) = _CategoryPageItemModel;

  factory CategoryPageItemModel.fromGetRecipesOfCategoryResponse({
    required RecipeShortInfo shortInfo,
  }) {
    return CategoryPageItemModel(
      recipeName: shortInfo.recipeName!,
      recipeThumb: shortInfo.recipeThumbLink!,
      recipeId: shortInfo.recipeId!,
    );
  }
}
