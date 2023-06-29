import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/model/database/get_favorite_recipes_response.dart';
import 'database.dart';

part 'local_db.g.dart';

@DriftDatabase(tables: [FavoriteTableEntry])
class FavoriteDatabase extends _$FavoriteDatabase implements Database {
  factory FavoriteDatabase() {
    return _instanse;
  }
  // To avoid conflict when multiple instanse of Database exist
  // The database will be a singleton
  FavoriteDatabase._internal() : super(_openConnection());

  static final FavoriteDatabase _instanse = FavoriteDatabase._internal();
  // you should bump this number whenever you change
  // or add a table definition.
  @override
  int get schemaVersion => 1;

  @override
  Future<void> deleteAllFavorites() async => favoriteTableEntry.deleteAll();

  @override
  Future<void> deleteFavorite(String recipeId) async =>
      favoriteTableEntry.deleteWhere((tbl) => tbl.recipeId.equals(recipeId));

  @override
  Stream<List<FavoriteRecipe>> getAllFavorites() =>
      select(favoriteTableEntry).watch();

  @override
  Future<void> insertFavorite(FavoriteTableEntryCompanion favorite) async {
    final checkExisted = await (select(favoriteTableEntry)
          ..where((tbl) => tbl.recipeId.equals(favorite.recipeId.value)))
        .get();
    // only insert when not existed in database
    if (checkExisted.isEmpty) {
      await favoriteTableEntry.insertOne(favorite);
    }
  }
}

// the LazyDatabase util
// lets us find the right location for the file async.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file,
    // called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'favorites.db'));
    return NativeDatabase.createInBackground(file);
  });
}
