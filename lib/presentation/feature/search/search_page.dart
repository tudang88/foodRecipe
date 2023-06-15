import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../data/providers/api_client_provider.dart';
import '../../../data/providers/food_recipes_repository_provider.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/use_case/search/get_recipes_by_search_name.dart';
import '../../common_widgets/search_widget.dart';
import 'widgets/search_recipe_list_item.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        CustomSearchWidget(
          onEditCompleted: (keyword) {
            log('Keyword: $keyword');
            ref.watch(keywordProvider.notifier).state = keyword;
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            'Here you are',
            style: Constants.headTextStyle,
          ),
        ),
        Expanded(
          child: searchResult.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return SearchResultListRecipeItem(
                  recipe: data[index],
                );
              },
            ),
            error: (err, stack) => Text('Err $err'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    );
  }
}
