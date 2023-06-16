import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/api/response/get_recipes_by_name_response.dart';

part 'recipe_detail_item_model.freezed.dart';

@freezed
class RecipeDetailsItemModel with _$RecipeDetailsItemModel {
  const factory RecipeDetailsItemModel({
    required String recipeId,
    required String recipeTitle,
    required String recipeThumb,
    required String recipeYoutube,
    required String recipeArea,
    required String recipeCategory,

    /// map ingredient - volume
    required Map<String, String> ingredients,
  }) = _RecipeDetailsItemModel;

  factory RecipeDetailsItemModel.fromGetRecipeDetailResponse({
    required RecipeDetails recipeDetails,
  }) {
    final ingredients = <String, String>{};
    ingredients[recipeDetails.strMeasure1!] = recipeDetails.strIngredient1!;
    ingredients[recipeDetails.strMeasure2!] = recipeDetails.strIngredient2!;
    ingredients[recipeDetails.strMeasure3!] = recipeDetails.strIngredient3!;
    ingredients[recipeDetails.strMeasure4!] = recipeDetails.strIngredient4!;
    ingredients[recipeDetails.strMeasure5!] = recipeDetails.strIngredient5!;
    ingredients[recipeDetails.strMeasure6!] = recipeDetails.strIngredient6!;
    ingredients[recipeDetails.strMeasure7!] = recipeDetails.strIngredient7!;
    ingredients[recipeDetails.strMeasure8!] = recipeDetails.strIngredient8!;
    ingredients[recipeDetails.strMeasure9!] = recipeDetails.strIngredient9!;
    ingredients[recipeDetails.strMeasure10!] = recipeDetails.strIngredient10!;
    ingredients[recipeDetails.strMeasure11!] = recipeDetails.strIngredient11!;
    ingredients[recipeDetails.strMeasure12!] = recipeDetails.strIngredient12!;
    ingredients[recipeDetails.strMeasure13!] = recipeDetails.strIngredient13!;
    ingredients[recipeDetails.strMeasure14!] = recipeDetails.strIngredient14!;
    ingredients[recipeDetails.strMeasure15!] = recipeDetails.strIngredient15!;
    ingredients[recipeDetails.strMeasure16!] = recipeDetails.strIngredient16!;
    ingredients[recipeDetails.strMeasure17!] = recipeDetails.strIngredient17!;
    ingredients[recipeDetails.strMeasure18!] = recipeDetails.strIngredient18!;
    ingredients[recipeDetails.strMeasure19!] = recipeDetails.strIngredient19!;
    ingredients[recipeDetails.strMeasure20!] = recipeDetails.strIngredient20!;

    return RecipeDetailsItemModel(
      recipeId: recipeDetails.recipeId!,
      recipeTitle: recipeDetails.recipeName!,
      recipeThumb: recipeDetails.recipeThumbLink!,
      recipeYoutube: recipeDetails.youtubeLink!,
      recipeArea: recipeDetails.area!,
      recipeCategory: recipeDetails.categoryName!,
      ingredients: ingredients,
    );
  }
}
