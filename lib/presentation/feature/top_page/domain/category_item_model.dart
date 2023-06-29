import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/api/response/get_all_categories_response.dart';

part 'category_item_model.freezed.dart';

@freezed
class CategoryItemModel with _$CategoryItemModel {
  const factory CategoryItemModel({
    required String id,
    required String title,
    required String imageUrl,
  }) = _CategoryItemModel;

  /// only use for testing api in the first time
  factory CategoryItemModel.fromGetAllCategory({
    required FoodCategory category,
  }) {
    final thumbnail = category.categoryThumbLink;
    return CategoryItemModel(
      id: category.categoryId!,
      title: category.categoryName!,
      imageUrl: thumbnail ?? '',
    );
  }
}
