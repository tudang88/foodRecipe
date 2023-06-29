import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../presentation/feature/favorite/domain/favorite_item_model.dart';
import '../../database/database.dart';

/// get all database items
final getAllFavoritesProvider =
    StreamProvider.family<List<FavoriteItemModel>, Database>(
  (ref, database) async* {
    final result = database.getAllFavorites();
    await for (final items in result.map(
      (dbEntries) => dbEntries
          .map((entry) => FavoriteItemModel.fromDbEntry(entry))
          .toList(),
    )) {
      yield items;
    }
  },
);
