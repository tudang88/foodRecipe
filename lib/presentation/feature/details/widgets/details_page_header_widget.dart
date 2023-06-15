import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/resources/colors.dart';

class DetailsPageHeaderWidget extends ConsumerWidget {
  const DetailsPageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: AppColors.light.lightBlue,
      child: const SizedBox(
        width: double.infinity,
        height: 200,
      ),
    );
  }
}
