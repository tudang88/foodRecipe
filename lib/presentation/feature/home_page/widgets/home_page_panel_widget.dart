import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/resources/images.dart';
import '../../../../constants/routes.dart';
import '../../../common_widgets/space_box.dart';
import '../models/panel_recipe_list_item_model.dart';

class HomePagePanelWidget extends ConsumerWidget {
  const HomePagePanelWidget({
    required this.panelItems,
    Key? key,
  }) : super(key: key);
  final List<PanelRecipeListItemModel> panelItems;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = CarouselController();
    return Container(
      color: Colors.white10,
      padding: const EdgeInsets.only(top: 8),
      child: CarouselSlider.builder(
        carouselController: controller,
        itemCount: panelItems.length,
        itemBuilder: (context, index, realIdx) {
          final imageUrl = panelItems[index].recipeThumb;
          final recipeId = panelItems[index].recipeId;
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteNames.recipeDetail,
                params: {RouteParams.pageId: recipeId},
              );
            },
            child: Card(
              elevation: 5,
              child: imageUrl.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: AppImages.loading,
                      image: imageUrl,
                      width: 800,
                      fit: BoxFit.fill,
                    )
                  : const SpaceBox(),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {},
        ),
      ),
    );
  }
}
