import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/resources/resources.dart';
import '../../../common_widgets/space_box.dart';

class FavoriteItemThumbnail extends ConsumerWidget {
  const FavoriteItemThumbnail({required this.thumbnail, super.key});
  final String? thumbnail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: thumbnail == null || thumbnail == ''
          ? const SpaceBox()
          : Padding(
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.loading,
                  image: thumbnail.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
