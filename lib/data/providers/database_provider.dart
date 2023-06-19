import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/database.dart';
import '../database/local_db.dart';
part 'database_provider.g.dart';

@riverpod
Database favoriteDb(FavoriteDbRef ref) => FavoriteDatabase();
