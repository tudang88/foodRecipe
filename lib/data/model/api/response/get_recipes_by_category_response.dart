import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_recipes_by_category_response.freezed.dart';
part 'get_recipes_by_category_response.g.dart';

/// The model class represent for the response of
/// https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood#
@freezed
class GetRecipesByCategoryResponse with _$GetRecipesByCategoryResponse {
  const factory GetRecipesByCategoryResponse({List<RecipeShortInfo>? meals}) =
      _GetRecipesByCategoryResponse;

  factory GetRecipesByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesByCategoryResponseFromJson(json);
}

/// The model class represent for each recipe in short format
@freezed
class RecipeShortInfo with _$RecipeShortInfo {
  const factory RecipeShortInfo({
    @JsonKey(name: 'strMeal') String? recipeName,
    @JsonKey(name: 'strMealThumb') String? recipeThumbLink,
    @JsonKey(name: 'idMeal') String? recipeId,
  }) = _RecipeShortInfo;
  factory RecipeShortInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeShortInfoFromJson(json);
}
