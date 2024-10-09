import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_case/favorites/get_all_favorite_items.dart';
import '../../../constants/resources/colors.dart';
import '../../../data/providers/common_provider.dart';
import '../../../data/providers/database_provider.dart';
import '../../common_widgets/base/base_page.dart';
import '../favorite_page/favorite_page.dart';
import '../home_page/home_page.dart';
import '../search_page/search_page.dart';
import 'widgets/main_screen_app_bar.dart';

class MainScreen extends BasePage {
  const MainScreen({Key? key}) : super(key: key);

  @override
  BasePageState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BasePageState<MainScreen>
    with WidgetsBindingObserver {
  final List _screens = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
  ];

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const MainScreenAppBar();
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final database = ref.watch(favoriteDbProvider);

    /// observe database
    final favoriteList = ref.watch(
      getAllFavoritesProvider(database),
    );
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
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.home_tab_favorite,
                icon: Builder(
                  builder: (context) {
                    final badgeCount = favoriteList.when(
                      data: (entryList) => entryList.length,
                      error: (_, error) => 0,
                      loading: () => 0,
                    );
                    return badges.Badge(
                      showBadge: badgeCount > 0,
                      position: badges.BadgePosition.topEnd(),
                      badgeStyle: const badges.BadgeStyle(
                        padding: EdgeInsets.all(6),
                      ),
                      badgeContent: Text(
                        '$badgeCount',
                        style: TextStyle(color: AppColors.light.white),
                      ),
                      child: const Icon(Icons.favorite),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
