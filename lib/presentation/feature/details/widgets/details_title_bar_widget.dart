import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/resources/resources.dart';

class DetailsTitleBarWidget extends ConsumerWidget {
  const DetailsTitleBarWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FittedBox(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            // borderRadius: BorderRadius.circular(5),
            // border: Border.all(color: Colors.orangeAccent, width: 1),
          ),
          child: Text(
            title,
            style: Constants.titleTextStyle,
          ),
        ),
      ),
    );
  }
}
