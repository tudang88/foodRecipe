import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/routes.dart';
import '../../../../constants/resources/resources.dart';
import '../../../common_widgets/space_box.dart';
import '../models/category_page_item_model.dart';

class CategoryPageRecipeListItem extends ConsumerWidget {
  const CategoryPageRecipeListItem({
    required this.recipe,
    Key? key,
  }) : super(key: key);
  final CategoryPageItemModel recipe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteNames.recipeDetail,
          params: {RouteParams.pageId: recipe.recipeId},
        );
      },
      child: Card(
        color: Colors.redAccent,
        elevation: 6,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: recipe.recipeThumb.isNotEmpty
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: AppImages.loading,
                        image: recipe.recipeThumb,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SpaceBox(),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  recipe.recipeName,
                  style: AppTextStyles.recipeCardTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
