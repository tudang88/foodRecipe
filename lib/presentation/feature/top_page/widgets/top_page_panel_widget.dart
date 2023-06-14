import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/panel_item_model.dart';

class TopPagePanelWidget extends ConsumerWidget {
  const TopPagePanelWidget({
    required this.panelItems,
    this.onClick,
    Key? key,
  }) : super(key: key);
  final AsyncValue<List<PanelRecipeItem>>? panelItems;
  final void Function(String id)? onClick;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = CarouselController();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/food_table.jpeg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Expanded(
          child: panelItems!.when(
            data: (allPanelItems) => CarouselSlider.builder(
              carouselController: controller,
              itemCount: allPanelItems.length,
              itemBuilder: (context, index, realIdx) {
                final imageUrl = allPanelItems[index].recipeThumb;
                final recipeId = allPanelItems[index].recipeId;
                return GestureDetector(
                  onTap: () {
                    /// delegate on click event
                    onClick!(recipeId);
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
                aspectRatio: 2,
                onPageChanged: (index, reason) {},
              ),
            ),
            error: (err, stack) => Center(
              child: Text('Panel Err $err'),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
