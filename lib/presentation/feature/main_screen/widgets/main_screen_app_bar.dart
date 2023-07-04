import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/resources/resources.dart';
import '../../../common_widgets/space_box.dart';

const double leadingWidth = 100;

class MainScreenAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.orangeAccent,
      toolbarHeight: kToolbarHeight,
      elevation: 0,
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: false,
      leading: null, //buildLeftContent(context),
      centerTitle: true,
      title: buildTitle(context),
      actions: buildActions(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }

  Widget buildLeftContent(BuildContext context) {
    return const SpaceBox();
  }

  Widget buildTitle(BuildContext context) {
    return const Text(
      'Food Recipe',
      style: Constants.titleTextStyle,
    );
  }

  List<Widget>? buildActions(BuildContext context) {
    return const <Widget>[SpaceBox()];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
