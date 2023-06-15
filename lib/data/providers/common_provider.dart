import 'package:flutter_riverpod/flutter_riverpod.dart';

final keywordProvider = StateProvider<String>((ref) {
  return '';
});

final currentTabProvider = StateProvider<int>((ref) => 0);
