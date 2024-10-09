import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/search/get_recipes_by_search_name.dart';
import '../../../constants/resources/resources.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/search_widget.dart';
import 'widgets/search_recipe_list_item.dart';

class SearchPage extends BasePageStateless {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(foodRecipesRepositoryProvider);
    final apiClient = ref.watch(apiClientProvider);
    final searchResult = ref.watch(
      searchRecipesByNameProvider(
        recipesRepository: repository,
        apiClient: apiClient,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchWidget(
          onEditCompleted: (keyword) {
            log('Keyword: $keyword');
            ref.watch(keywordProvider.notifier).state = keyword;
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            'Here you are',
            style: AppTextStyles.headTextStyle,
          ),
        ),
        Expanded(
          child: searchResult.when(
            data: (data) => GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                for (final item in data)
                  SearchRecipeListRecipeItem(
                    recipe: item,
                  ),
              ],
            ),
            error: (err, stack) => Text('Err $err'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
