import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';

class CategoryPage extends BasePageStateless {
  const CategoryPage({required this.title, required this.thumbnail, Key? key})
      : super(key: key);
  final String title;
  final String thumbnail;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return Center(child: Text('Category Page for $title'));
  }
}
