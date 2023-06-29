import 'package:drift/drift.dart';

/// use @DataClassName notation in case we want the data class has different name with the default.
/// By default, the data class will be the table class name stripping the last letter,
/// for example, the default data class of FavoriteTable => FavoriteTabl
@DataClassName('FavoriteRecipe')
class FavoriteTableEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recipeId => text()();
  TextColumn get recipeTitle => text()();
  TextColumn get recipeThumb => text()();
  TextColumn get recipeCategory => text()();
  TextColumn get recipeAre => text()();
}
