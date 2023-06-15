import 'package:flutter/cupertino.dart';

import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';

class DetailsPage extends BasePageStateless {
  const DetailsPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(child: Text('Details Page for $id'));
  }
}
