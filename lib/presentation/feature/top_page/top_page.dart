import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../../data/use_case/categories/get_all_categories.dart';
import '../../../data/use_case/panel/get_panel_recipes.dart';
import '../../common_widgets/search_widget.dart';
import 'widgets/top_page_category_item_widget.dart';
import 'widgets/top_page_panel_widget.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final apiClient = ref.watch(apiClientProvider);
    final repository = ref.watch(foodRecipesRepositoryProvider);
    final allCategories = ref.watch(
      allRecipeCategoriesProvider(
        apiClient: apiClient,
        recipesRepository: repository,
      ),
    );
    final panelItems = ref.watch(
      panelRecipesProvider(
        apiClient: apiClient,
        recipesRepository: repository,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopPagePanelWidget(
          panelItems: panelItems,
          onClick: (idStr) {
            /// process on click here
            log('RecipeId:$idStr');
          },
        ),
        CustomSearchWidget(
          onEditCompleted: (keyword) {
            log('Keyword: $keyword');
          },
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Categories 🍱🍣',
            textAlign: TextAlign.left,
            style: Constants.headTextStyle,
          ),
        ),
        allCategories.when(
          error: (err, stack) => Text('Err $err'),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (categories) {
            return Expanded(
              child: GridView.count(
                shrinkWrap: true,
                restorationId: 'grid_view_top_anime',
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                childAspectRatio: 1,
                children: [
                  for (final category in categories)
                    TopPageCategoryItemWidget(categoryItemModel: category)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
