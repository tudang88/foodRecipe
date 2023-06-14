import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyword_provider.g.dart';

@riverpod
String searchKeyword(SearchKeywordRef ref, String newString) => newString;

final keywordProvider = StateProvider<String>((ref) {
  return '';
});
