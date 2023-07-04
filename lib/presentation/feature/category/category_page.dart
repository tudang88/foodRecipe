import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/one_category/get_recipes_of_category.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';
import 'widgets/category_page_header_widget.dart';
import 'widgets/category_page_recipe_list_item.dart';

class CategoryPage extends BasePageStateless {
  const CategoryPage({required this.title, required this.thumbnail, Key? key})
      : super(key: key);
  final String title;
  final String thumbnail;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final apiClient = ref.watch(apiClientProvider);
    final repository = ref.watch(foodRecipesRepositoryProvider);
    final recipes = ref.watch(
      getRecipesShortOfCategoryProvider(
        apiClient: apiClient,
        recipesRepository: repository,
        category: title,
      ),
    );
    return recipes.when(
      data: (recipesShortLists) {
        return Column(
          children: [
            CategoryPageHeaderWidget(
              categoryTitle: title,
              categoryThumb: thumbnail,
            ),
            Flexible(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  for (final recipe in recipesShortLists)
                    CategoryPageRecipeListItem(
                      recipe: recipe,
                    )
                ],
              ),
            )
          ],
        );
      },
      error: (err, stack) => Text('Err $err'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
