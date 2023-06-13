import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/api/response/get_all_categories_response.dart';
import '../model/api/response/get_top_anime_response.dart';
import 'api_paths.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiPaths.getTopAnime)
  Future<GetTopAnimeResponse> getTopAnime({
    @Query('type') required String type,
    @Query('filter') required String filter,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  /// get all category by GET
  /// www.themealdb.com/api/json/v1/1/categories.php
  @GET(ApiPaths.getRecipesAllCategories)
  Future<GetAllCategoriesResponse> getAllCategories();
}
