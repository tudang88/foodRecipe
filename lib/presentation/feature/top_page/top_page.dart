import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../../data/use_case/food/get_all_categories.dart';
import 'widgets/top_page_category_item_widget.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// get recipes repository from river_pod provider
    final allCategories = ref.watch(
      allRecipeCategoriesProvider(
        apiClient: ref.watch(apiClientProvider),
        recipesRepository: ref.watch(foodRecipesRepositoryProvider),
      ),
    );
    return Column(
      children: [
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
