import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/api/response/get_all_categories_response.dart';
import '../model/api/response/get_recipes_by_category_response.dart';
import '../model/api/response/get_recipes_by_name_response.dart';
import 'api_paths.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// get all category by GET
  /// www.themealdb.com/api/json/v1/1/categories.php
  @GET(ApiPaths.getRecipesAllCategories)
  Future<GetAllCategoriesResponse> getAllCategories();

  /// get all Recipes of one category
  /// www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
  @GET(ApiPaths.getRecipesByCategory)
  Future<GetRecipesByCategoryResponse> getAllRecipesOfCategory({
    @Query('c') required String category,
  });

  /// get all recipes by keyword searching
  /// www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
  @GET(ApiPaths.getRecipeByName)
  Future<GetRecipesByNameSearchResponse> getAllRecipesByName({
    @Query('s') required String keyword,
  });

  /// get
  @GET(ApiPaths.getRecipeById)
  Future<GetRecipeByIdResponse> getRecipeById({
    @Query('i') required String recipeId,
  });
}
