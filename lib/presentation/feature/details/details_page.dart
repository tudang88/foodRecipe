import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/favorites/add_favorite_to_db.dart';
import '../../../application/use_case/favorites/remove_favorite_from_db.dart';
import '../../../application/use_case/recipe_details/get_recipe_details.dart';
import '../../../data/database/database.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/providers/database_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../../data/repository/food_recipes_repository.dart';
import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';
import 'models/recipe_detail_item_model.dart';
import 'widgets/details_ingredients_widget.dart';
import 'widgets/details_instruction_widget.dart';
import 'widgets/details_page_header_widget.dart';
import 'widgets/details_title_bar_widget.dart';

class DetailsPage extends BasePageStateless {
  const DetailsPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final favoriteFlag = ref.watch(favoriteStatusProvider(id));
    final database = ref.watch(favoriteDbProvider);
    final apiClient = ref.watch(apiClientProvider);
    final repository = ref.watch(foodRecipesRepositoryProvider);
    final recipe = ref.watch(
      getRecipeDetailsProvider(
        apiClient: apiClient,
        recipesRepository: repository,
        id: id,
      ),
    );

    return recipe.when(
      data: (recipeDetails) {
        final recipe = recipeDetails[0];
        return SingleChildScrollView(
          child: Column(
            children: [
              DetailsPageHeaderWidget(
                thumbnail: recipe.recipeThumb,
                // youtubeLink: recipe.recipeYoutube,
              ),

              /// Title bar
              DetailsTitleBarWidget(title: recipe.recipeTitle),
              DetailsIngredientsWidget(ingredients: recipe.ingredients),
              DetailsInstructionWidget(instruction: recipe.recipeInstruction),
              TextButton.icon(
                onPressed: () {
                  updateFavorite(
                    ref,
                    database,
                    repository,
                    recipe,
                    favoriteFlag,
                  );
                },
                icon: favoriteFlag
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
                label: const Text('Add Favorite'),
              ),
            ],
          ),
        );
      },
      error: (err, stack) => Text('Err $err'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  // update database
  void updateFavorite(
    WidgetRef ref,
    Database database,
    FoodRecipesRepository repository,
    RecipeDetailsItemModel recipe,
    bool favorite,
  ) {
    // remove from favorite list
    if (favorite) {
      ref.watch(
        removeFavoriteItemProvider(
          database: database,
          repository: repository,
          recipeId: recipe.recipeId,
        ),
      );
    } else {
      // add to favorite list
      ref.watch(
        addFavoriteItemToDbProvider(
          database: database,
          repository: repository,
          recipe: recipe,
        ),
      );
    }
    ref.watch(favoriteStatusProvider(id).notifier).update((state) => !favorite);
  }
}
