import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/resources/colors.dart';

mixin BasePageMixin {
  bool get resizeToAvoidBottomInset => false;

  bool get tapOutsideHideKeyboard => false;

  Color? get backgroundColor => null;

  void onWillPop(bool canPop) => true;

  Widget buildBody(BuildContext context, WidgetRef ref);

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget? buildBottomNavigationBar(BuildContext context) => null;

  Widget? buildBottomSheet(BuildContext context) => null;

  Widget? buildDrawer(BuildContext context) => null;

  Widget? buildEndDrawer(BuildContext context) => null;

  Widget? buildFloatActionButton(BuildContext context) => null;

  Widget buildPage(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: PopScope(
        onPopInvoked: Platform.isIOS ? null : onWillPop,
        child: GestureDetector(
          onTap: () {
            if (tapOutsideHideKeyboard) {
              _hideKeyboard(context);
            }
          },
          child: tapOutsideHideKeyboard
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: buildBody(context, ref),
                )
              : buildBody(context, ref),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFloatActionButton(context),
    );
  }

  void _hideKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
