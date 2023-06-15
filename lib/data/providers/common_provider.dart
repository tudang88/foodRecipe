import 'package:flutter_riverpod/flutter_riverpod.dart';

/// a shared variable maintain search keyword
final keywordProvider = StateProvider<String>((ref) => '');

/// a shared variable maintain current tab index
final currentTabProvider = StateProvider<int>((ref) => 0);
