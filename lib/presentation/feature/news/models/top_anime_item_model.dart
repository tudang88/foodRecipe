import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/api/response/get_all_categories_response.dart';
import '../../../../data/model/api/response/get_top_anime_response.dart';

part 'top_anime_item_model.freezed.dart';

@freezed
class TopAnimeItemModel with _$TopAnimeItemModel {
  const factory TopAnimeItemModel({
    required int id,
    required String titleEn,
    required String titleJp,
    required String imageUrl,
  }) = _AnimeNewsItemModel;

  factory TopAnimeItemModel.fromGetTopAnimeResponse({
    required GetTopAnimeResponseData responseData,
  }) {
    final firstImage = responseData.images?.jpg?.imageUrl;
    return TopAnimeItemModel(
      id: responseData.malId,
      titleEn: responseData.titleEnglish ?? '',
      titleJp: responseData.titleJapanese ?? '',
      imageUrl: firstImage ?? '',
    );
  }

  /// only use for testing api in the first time
  factory TopAnimeItemModel.fromGetAllCategory({
    required FoodCategory category,
  }) {
    final thumbnail = category.categoryThumbLink;
    return TopAnimeItemModel(
      id: int.parse(category.categoryId!),
      titleEn: category.categoryName!,
      titleJp: category.categoryName!,
      imageUrl: thumbnail ?? '',
    );
  }
}
