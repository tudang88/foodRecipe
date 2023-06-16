import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/routes.dart';
import '../domain/panel_item_model.dart';

class TopPagePanelWidget extends ConsumerWidget {
  const TopPagePanelWidget({
    required this.panelItems,
    Key? key,
  }) : super(key: key);
  final AsyncValue<List<PanelRecipeItem>>? panelItems;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = CarouselController();
    return Container(
      color: Colors.white10,
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: panelItems!.when(
          data: (allPanelItems) => CarouselSlider.builder(
            carouselController: controller,
            itemCount: allPanelItems.length,
            itemBuilder: (context, index, realIdx) {
              final imageUrl = allPanelItems[index].recipeThumb;
              final recipeId = allPanelItems[index].recipeId;
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    RouteNames.recipeDetail,
                    params: {RouteParams.pageId: recipeId},
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 800,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {},
            ),
          ),
          error: (err, stack) => Center(
            child: Text('Panel Err $err'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
