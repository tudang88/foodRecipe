import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_page_mixin.dart';

abstract class BasePageStateless extends ConsumerWidget with BasePageMixin {
  const BasePageStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => buildPage(context, ref);
}
