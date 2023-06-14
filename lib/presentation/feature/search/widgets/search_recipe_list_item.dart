import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/constants.dart';

class SearchResultListRecipeItem extends ConsumerWidget {
  const SearchResultListRecipeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Row(
          children: [
            Container(
              width: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.themealdb.com/images/category/beef.png',
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Category: Beef',
                      style: Constants.headTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'This is Beef Stake from California',
                      style: Constants.contentTextStyle,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
