import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/resources/colors.dart';
import '../../../../constants/resources/images.dart';
import '../../../../constants/routes.dart';
import '../../../common_widgets/space_box.dart';
import '../models/category_item_model.dart';

class HomePageCategoryItemWidget extends ConsumerWidget {
  const HomePageCategoryItemWidget({
    required this.categoryItemModel,
    Key? key,
  }) : super(key: key);
  final CategoryItemModel categoryItemModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteNames.categoryDetail,
        params: {
          RouteParams.categoryName: categoryItemModel.title,
          RouteParams.categoryThumb: categoryItemModel.imageUrl,
        },
      ),
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(4),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: AppColors.light.orangeAccent,
            title: _GridTitleText(
              categoryItemModel.title,
              GridItemTextType.title,
              int.parse(categoryItemModel.id),
            ),
          ),
        ),
        child: Material(
          color: AppColors.light.lightBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAlias,
          child: categoryItemModel.imageUrl.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: AppImages.loading,
                  image: categoryItemModel.imageUrl,
                )
              : const SpaceBox(),
        ),
      ),
    );
  }
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text, this.type, this.id);

  final String text;
  final GridItemTextType type;
  final int id;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      key: ValueKey('GridTitleText_$id${type.name}'),
      child: Text(' $text'),
    );
  }
}

enum GridItemTextType { title, subtitle }
