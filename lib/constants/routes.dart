class RoutePaths {
  RoutePaths._private();

  static const root = '/';

  static const categoryDetail = 'category/:name';
  static const recipeDetail = 'details/:id';
}

class RouteNames {
  RouteNames._private();

  static const categoryDetail = 'category_detail';
  static const recipeDetail = 'recipe_detail';
}

class RouteParams {
  RouteParams._private();

  static const pageId = 'id';
  static const categoryName = 'name';
}
