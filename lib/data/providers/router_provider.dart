import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/routes.dart';
import '../../presentation/feature/category/category_page.dart';
import '../../presentation/feature/details/details_page.dart';
import '../../presentation/feature/main_screen/main_screen.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter goRouter(ref) => GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: RoutePaths.root,
          builder: (context, state) {
            return const MainScreen();
          },
          routes: [
            GoRoute(
              name: RouteNames.categoryDetail,
              path: RoutePaths.categoryDetail,
              builder: (context, state) {
                return CategoryPage(
                  title: state.params[RouteParams.categoryName]!,
                  thumbnail: state.params[RouteParams.categoryThumb]!,
                );
              },
            ),
            GoRoute(
              name: RouteNames.recipeDetail,
              path: RoutePaths.recipeDetail,
              builder: (context, state) {
                return DetailsPage(
                  id: state.params[RouteParams.pageId]!,
                );
              },
            ),
          ],
        ),
      ],
    );
