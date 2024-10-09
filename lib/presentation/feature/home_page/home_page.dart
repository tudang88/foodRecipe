import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/categories/get_all_categories.dart';
import '../../../application/use_case/panel/get_panel_recipes.dart';
import '../../../constants/resources/resources.dart';
import '../../../constants/routes.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/search_widget.dart';
import 'models/panel_recipe_list_item_model.dart';
import 'widgets/home_page_category_item_widget.dart';
import 'widgets/home_page_panel_widget.dart';

class HomePage extends BasePageStateless {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final key1 = GlobalKey();
    final key2 = GlobalKey();
    final key3 = GlobalKey();
    final key4 = GlobalKey();
    final key5 = GlobalKey();

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
    return CustomScrollView(
      key: key5,
      slivers: [
        SliverAppBar(
          key: key1,
          elevation: 0,
          pinned: false,
          expandedHeight: 250,
          flexibleSpace: createPanel(panelItems),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverAppBar(
            key: key2,
            elevation: 0,
            flexibleSpace: SearchWidget(
              onEditCompleted: (keyword) {
                log('Keyword: $keyword');
                if (keyword != '') {
                  // transition to Search Tab and perform search
                  ref
                      .watch(currentTabProvider.notifier)
                      .update((state) => MainScreenNavigation.searchPage.index);
                  ref
                      .watch(keywordProvider.notifier)
                      .update((state) => keyword);
                }
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverAppBar(
            key: key3,
            pinned: true,
            flexibleSpace: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Categories 🍱🍣',
                textAlign: TextAlign.left,
                style: AppTextStyles.headTextStyle,
              ),
            ),
          ),
        ),
        allCategories.when(
          error: (err, stack) => SliverToBoxAdapter(child: Text('Err $err')),
          loading: () => const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          data: (categories) {
            return SliverPadding(
              key: key4,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                children: [
                  for (final category in categories)
                    HomePageCategoryItemWidget(categoryItemModel: category),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // create Panel from remote data
  Widget createPanel(AsyncValue<List<PanelRecipeListItemModel>> panelItems) {
    return panelItems.when(
      data: (items) => HomePagePanelWidget(
        panelItems: items,
      ),
      error: (err, stack) => Text('Panel Err $err'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
