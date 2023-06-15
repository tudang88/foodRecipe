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
    required List<Map<String, String>> ingredients,
  }) = _RecipeDetailsItemModel;

  factory RecipeDetailsItemModel.fromGetRecipeDetailResponse({
    required RecipeDetails recipeDetails,
  }) {
    final ingredients = <Map<String, String>>[];
    ingredients
        .add({recipeDetails.strMeasure1!: recipeDetails.strIngredient1!});
    ingredients
        .add({recipeDetails.strMeasure2!: recipeDetails.strIngredient2!});
    ingredients
        .add({recipeDetails.strMeasure3!: recipeDetails.strIngredient3!});
    ingredients
        .add({recipeDetails.strMeasure4!: recipeDetails.strIngredient4!});
    ingredients
        .add({recipeDetails.strMeasure5!: recipeDetails.strIngredient5!});
    ingredients
        .add({recipeDetails.strMeasure6!: recipeDetails.strIngredient6!});
    ingredients
        .add({recipeDetails.strMeasure7!: recipeDetails.strIngredient7!});
    ingredients
        .add({recipeDetails.strMeasure8!: recipeDetails.strIngredient8!});
    ingredients
        .add({recipeDetails.strMeasure9!: recipeDetails.strIngredient9!});
    ingredients
        .add({recipeDetails.strMeasure10!: recipeDetails.strIngredient10!});
    ingredients
        .add({recipeDetails.strMeasure11!: recipeDetails.strIngredient11!});
    ingredients
        .add({recipeDetails.strMeasure12!: recipeDetails.strIngredient12!});
    ingredients
        .add({recipeDetails.strMeasure13!: recipeDetails.strIngredient13!});
    ingredients
        .add({recipeDetails.strMeasure14!: recipeDetails.strIngredient14!});
    ingredients
        .add({recipeDetails.strMeasure15!: recipeDetails.strIngredient15!});
    ingredients
        .add({recipeDetails.strMeasure16!: recipeDetails.strIngredient16!});
    ingredients
        .add({recipeDetails.strMeasure17!: recipeDetails.strIngredient17!});
    ingredients
        .add({recipeDetails.strMeasure18!: recipeDetails.strIngredient18!});
    ingredients
        .add({recipeDetails.strMeasure19!: recipeDetails.strIngredient19!});
    ingredients
        .add({recipeDetails.strMeasure20!: recipeDetails.strIngredient20!});

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
