import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/resources/images.dart';
import '../../../../constants/routes.dart';
import '../domain/search_item_model.dart';

class SearchResultListRecipeItem extends ConsumerWidget {
  const SearchResultListRecipeItem({
    required this.recipe,
    Key? key,
  }) : super(key: key);
  final SearchResultItemModel? recipe;
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
        child: SizedBox(
          width: 200,
          height: 200,
          child: Row(
            children: [
              Container(
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      recipe!.recipeThumbnail,
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Category: ${recipe!.recipeCategory}',
                        style: Constants.headTextStyle,
                      ),
                    ),
                    Text(
                      recipe!.recipeName,
                      style: Constants.contentTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
