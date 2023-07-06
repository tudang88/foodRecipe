import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/resources/resources.dart';

class CategoryPageHeaderWidget extends ConsumerWidget {
  const CategoryPageHeaderWidget({
    required this.categoryTitle,
    required this.categoryThumb,
    Key? key,
  }) : super(key: key);
  final String categoryThumb;
  final String categoryTitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(color: Colors.white54),
            child: Image.network(
              categoryThumb,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ColoredBox(
            color: AppColors.light.orangeAccent,
            child: Text(
              categoryTitle,
              style: AppTextStyles.titleTextStyle,
            ),
          ),
        )
      ],
    );
  }
}
