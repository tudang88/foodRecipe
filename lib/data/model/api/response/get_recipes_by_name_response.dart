import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_recipes_by_name_response.g.dart';
part 'get_recipes_by_name_response.freezed.dart';

/// the response of the below request GET
/// www.themealdb.com/api/json/v1/1/search.php?s={name}
@freezed
class GetRecipesByNameSearchResponse with _$GetRecipesByNameSearchResponse {
  const factory GetRecipesByNameSearchResponse({List<RecipeDetails>? meals}) =
      _GetRecipesByNameSearchResponse;
  factory GetRecipesByNameSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesByNameSearchResponseFromJson(json);
}

/// the response of the below request GET
/// www.themealdb.com/api/json/v1/1/lookup.php?i={id}
@freezed
class GetRecipeByIdResponse with _$GetRecipeByIdResponse {
  const factory GetRecipeByIdResponse({List<RecipeDetails>? meals}) =
      _GetRecipeByIdResponse;

  factory GetRecipeByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecipeByIdResponseFromJson(json);
}

/// The data model represent for each recipe got by searching name or directly specify recipeId
/// www.themealdb.com/api/json/v1/1/lookup.php?i={id}
/// www.themealdb.com/api/json/v1/1/search.php?s={name}
@freezed
class RecipeDetails with _$RecipeDetails {
  const factory RecipeDetails({
    @JsonKey(name: 'idMeal') String? recipeId,
    @JsonKey(name: 'strMeal') String? recipeName,
    @JsonKey(name: 'strCategory') String? categoryName,
    @JsonKey(name: 'strArea') String? area,
    @JsonKey(name: 'strInstructions') String? instruction,
    @JsonKey(name: 'strMealThumb') String? recipeThumbLink,
    String? tags,
    @JsonKey(name: 'strYoutube') String? youtubeLink,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strIngredient16,
    String? strIngredient17,
    String? strIngredient18,
    String? strIngredient19,
    String? strIngredient20,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strMeasure16,
    String? strMeasure17,
    String? strMeasure18,
    String? strMeasure19,
    String? strMeasure20,
  }) = _RecipeDetails;

  factory RecipeDetails.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsFromJson(json);
}
