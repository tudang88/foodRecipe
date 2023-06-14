import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../common_widgets/search_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchWidget(
          onEditCompleted: (keyword) {
            log('Keyword: $keyword');
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Here you are',
            style: Constants.headTextStyle,
          ),
        ),
      ],
    );
  }
}
