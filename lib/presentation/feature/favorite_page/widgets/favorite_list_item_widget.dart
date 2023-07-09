import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/resources/resources.dart';
import '../../../../constants/routes.dart';
import '../models/favorite_item_model.dart';
import 'favorite_item_thumbnail.dart';

class FavoriteListItemWidget extends ConsumerWidget {
  const FavoriteListItemWidget({
    required this.favoriteItem,
    required this.onclick,
    super.key,
  });
  final void Function()? onclick;
  final FavoriteItemModel favoriteItem;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteNames.recipeDetail,
                params: {RouteParams.pageId: favoriteItem.recipeId},
              );
            },
            child: Row(
              children: [
                FavoriteItemThumbnail(
                  thumbnail: favoriteItem.recipeThumb,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        favoriteItem.recipeTitle,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        favoriteItem.recipeCategory,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        favoriteItem.recipeArea,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            color: AppColors.light.border,
          ),
          TextButton(
            onPressed: onclick,
            child: const Text('Remove'),
          )
        ],
      ),
    );
  }
}
