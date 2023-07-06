import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/favorites/get_all_favorite_items.dart';
import '../../../application/use_case/favorites/remove_favorite_from_db.dart';
import '../../../data/providers/database_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import 'widgets/favorite_list_item_widget.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(favoriteDbProvider);
    final repository = ref.watch(foodRecipesRepositoryProvider);

    /// observe database
    final favoriteList = ref.watch(
      getAllFavoritesProvider(database),
    );

    return favoriteList.when(
      data: (favoriteList) => ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          return FavoriteListItemWidget(
            favoriteItem: favoriteList[index],
            onclick: () async {
              final recipeId = favoriteList[index].recipeId;
              ref.watch(
                removeFavoriteItemProvider(
                  database: database,
                  repository: repository,
                  recipeId: recipeId,
                ),
              );
            },
          );
        },
      ),
      error: (err, stack) => Text('Err $err'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
