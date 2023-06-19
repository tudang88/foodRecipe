import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../model/database/get_favorite_recipes_response.dart';
import 'database.dart';

part 'local_db.g.dart';

@DriftDatabase(tables: [FavoriteTableEntry])
class FavoriteDatabase extends _$FavoriteDatabase implements Database {
  FavoriteDatabase() : super(_openConnection());

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
  Future<List<FavoriteRecipe>> getAllFavorites() =>
      select(favoriteTableEntry).get();

  @override
  Future<void> insertFavorite(FavoriteTableEntryCompanion favorite) async {
    await favoriteTableEntry.insertOne(favorite);
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
