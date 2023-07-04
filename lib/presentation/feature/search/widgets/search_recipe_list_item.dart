import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/resources/resources.dart';
import '../../../../constants/routes.dart';
import '../../../common_widgets/space_box.dart';
import '../models/search_recipe_list_item_model.dart';

class SearchRecipeListRecipeItem extends ConsumerWidget {
  const SearchRecipeListRecipeItem({
    required this.recipe,
    Key? key,
  }) : super(key: key);
  final SearchRecipeListItemModel? recipe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteNames.recipeDetail,
          params: {RouteParams.pageId: recipe!.recipeId},
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: recipe!.recipeThumbnail.isNotEmpty
                  ? ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: AppImages.loading,
                        image: recipe!.recipeThumbnail,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SpaceBox(),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  recipe!.recipeName,
                  style: Constants.searchResultTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
