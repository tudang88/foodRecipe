import 'package:flutter/cupertino.dart';

import '../../common_widgets/base/base_page_stateless.dart';
import '../../common_widgets/child_page_app_bar.dart';
import 'widgets/details_page_header_widget.dart';

class DetailsPage extends BasePageStateless {
  const DetailsPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const ChildPageAppBar();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        const DetailsPageHeaderWidget(),
        Center(child: Text('Details Page for $id')),
      ],
    );
  }
}
