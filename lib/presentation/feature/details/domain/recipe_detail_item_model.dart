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
    required String recipeInstruction,

    /// map ingredient - volume
    required Map<String, String> ingredients,
  }) = _RecipeDetailsItemModel;

  factory RecipeDetailsItemModel.fromGetRecipeDetailResponse({
    required RecipeDetails recipeDetails,
  }) {
    final ingredients = <String, String>{};
    if (recipeDetails.strMeasure1 != null &&
        recipeDetails.strIngredient1 != null) {
      ingredients[recipeDetails.strMeasure1!] = recipeDetails.strIngredient1!;
    }
    if (recipeDetails.strMeasure2 != null &&
        recipeDetails.strIngredient2 != null) {
      ingredients[recipeDetails.strMeasure2!] = recipeDetails.strIngredient2!;
    }
    if (recipeDetails.strMeasure3 != null &&
        recipeDetails.strIngredient3 != null) {
      ingredients[recipeDetails.strMeasure3!] = recipeDetails.strIngredient3!;
    }
    if (recipeDetails.strMeasure4 != null &&
        recipeDetails.strIngredient4 != null) {
      ingredients[recipeDetails.strMeasure4!] = recipeDetails.strIngredient4!;
    }
    if (recipeDetails.strMeasure5 != null &&
        recipeDetails.strIngredient5 != null) {
      ingredients[recipeDetails.strMeasure5!] = recipeDetails.strIngredient5!;
    }
    if (recipeDetails.strMeasure6 != null &&
        recipeDetails.strIngredient6 != null) {
      ingredients[recipeDetails.strMeasure6!] = recipeDetails.strIngredient6!;
    }
    if (recipeDetails.strMeasure7 != null &&
        recipeDetails.strIngredient7 != null) {
      ingredients[recipeDetails.strMeasure7!] = recipeDetails.strIngredient7!;
    }
    if (recipeDetails.strMeasure8 != null &&
        recipeDetails.strIngredient8 != null) {
      ingredients[recipeDetails.strMeasure8!] = recipeDetails.strIngredient8!;
    }
    if (recipeDetails.strMeasure9 != null &&
        recipeDetails.strIngredient9 != null) {
      ingredients[recipeDetails.strMeasure9!] = recipeDetails.strIngredient9!;
    }
    if (recipeDetails.strMeasure10 != null &&
        recipeDetails.strIngredient10 != null) {
      ingredients[recipeDetails.strMeasure10!] = recipeDetails.strIngredient10!;
    }
    if (recipeDetails.strMeasure11 != null &&
        recipeDetails.strIngredient11 != null) {
      ingredients[recipeDetails.strMeasure11!] = recipeDetails.strIngredient11!;
    }
    if (recipeDetails.strMeasure12 != null &&
        recipeDetails.strIngredient12 != null) {
      ingredients[recipeDetails.strMeasure12!] = recipeDetails.strIngredient12!;
    }
    if (recipeDetails.strMeasure13 != null &&
        recipeDetails.strIngredient13 != null) {
      ingredients[recipeDetails.strMeasure13!] = recipeDetails.strIngredient13!;
    }
    if (recipeDetails.strMeasure14 != null &&
        recipeDetails.strIngredient14 != null) {
      ingredients[recipeDetails.strMeasure14!] = recipeDetails.strIngredient14!;
    }
    if (recipeDetails.strMeasure15 != null &&
        recipeDetails.strIngredient15 != null) {
      ingredients[recipeDetails.strMeasure15!] = recipeDetails.strIngredient15!;
    }
    if (recipeDetails.strMeasure16 != null &&
        recipeDetails.strIngredient16 != null) {
      ingredients[recipeDetails.strMeasure16!] = recipeDetails.strIngredient16!;
    }
    if (recipeDetails.strMeasure17 != null &&
        recipeDetails.strIngredient17 != null) {
      ingredients[recipeDetails.strMeasure17!] = recipeDetails.strIngredient17!;
    }
    if (recipeDetails.strMeasure18 != null &&
        recipeDetails.strIngredient18 != null) {
      ingredients[recipeDetails.strMeasure18!] = recipeDetails.strIngredient18!;
    }
    if (recipeDetails.strMeasure19 != null &&
        recipeDetails.strIngredient19 != null) {
      ingredients[recipeDetails.strMeasure19!] = recipeDetails.strIngredient19!;
    }
    if (recipeDetails.strMeasure20 != null &&
        recipeDetails.strIngredient20 != null) {
      ingredients[recipeDetails.strMeasure20!] = recipeDetails.strIngredient20!;
    }
    return RecipeDetailsItemModel(
      recipeId: recipeDetails.recipeId!,
      recipeTitle: recipeDetails.recipeName!,
      recipeThumb: recipeDetails.recipeThumbLink!,
      recipeYoutube: recipeDetails.youtubeLink!,
      recipeArea: recipeDetails.area!,
      recipeCategory: recipeDetails.categoryName!,
      recipeInstruction: recipeDetails.instruction!,
      ingredients: ingredients,
    );
  }
}
