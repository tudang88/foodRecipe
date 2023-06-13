import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_categories_response.freezed.dart';
part 'get_all_categories_response.g.dart';

/// The response when query
/// www.themealdb.com/api/json/v1/1/categories.php
@freezed
class GetAllCategoriesResponse with _$GetAllCategoriesResponse {
  const factory GetAllCategoriesResponse({List<FoodCategory>? categories}) =
      _GetAllCategoriesResponse;

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);
}

/// The model class represent for each category obtaining from the above query
@freezed
class FoodCategory with _$FoodCategory {
  const factory FoodCategory({
    @JsonKey(name: 'idCategory') String? categoryId,
    @JsonKey(name: 'strCategory') String? categoryName,
    @JsonKey(name: 'strCategoryThumb') String? categoryThumbLink,
    @JsonKey(name: 'strCategoryDescription') String? categoryDescription,
  }) = _FoodCategory;

  factory FoodCategory.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryFromJson(json);
}
