import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeIngredientsWidget extends ConsumerWidget {
  const RecipeIngredientsWidget({
    required this.ingredients,
    Key? key,
  }) : super(key: key);
  final Map<String, String> ingredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            IngredientLineWidget(
              ingredient: ingredients,
            )
          ],
        ),
      ),
    );
  }
}

class IngredientLineWidget extends ConsumerWidget {
  const IngredientLineWidget({
    required this.ingredient,
    Key? key,
  }) : super(key: key);
  final Map<String, String> ingredient;
  List<Row>? helpFunction() {
    final keyList = ingredient.keys.toList();
    final resultList = <Row>[];
    for (final volume in keyList) {
      final name = ingredient[volume];
      // log('Ingredients name: $name');
      // log('Ingredients volume: $volume');
      if (name == '') {
        continue;
      }
      resultList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name!),
            Text(volume),
          ],
        ),
      );
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: helpFunction() ?? [],
      ),
    );
  }
}
