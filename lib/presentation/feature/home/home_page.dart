import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/resources/colors.dart';
import '../../../data/providers/common_provider.dart';
import '../../common_widgets/base/base_page.dart';
import '../search/search_page.dart';
import '../top_page/top_page.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  BasePageState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage>
    with WidgetsBindingObserver {
  final List _screens = [const TopPage(), const SearchPage()];

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const HomeAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(currentTabProvider);
        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              ref.watch(currentTabProvider.notifier).update((state) => value);
            },
            selectedItemColor: context.colors.mediumBlue,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.home_tab_top_page,
                icon: const Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.home_tab_search,
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        );
      },
    );
  }
}
