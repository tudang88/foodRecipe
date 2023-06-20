import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPageHeaderWidget extends ConsumerWidget {
  const DetailsPageHeaderWidget({
    required this.thumbnail,
    // required this.youtubeLink,
    Key? key,
  }) : super(key: key);
  final String thumbnail;
  // final String youtubeLink;

  /// youtube link sometime null or empty,
  /// so it's better to separate the case to avoid crash
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var youtubeId = '';
    // var isYoutubeUrlValid = true;
    // if (youtubeLink.contains('v=')) {
    //   youtubeId = youtubeLink.split('v=')[1].split(RegExp(r'(&|\?)'))[0];
    // } else {
    //   isYoutubeUrlValid = false;
    // }
    return Container(
      padding: const EdgeInsets.only(top: 8),
      color: Colors.white10,
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: buildCarouselSlider(),
      ),
    );
  }

  Widget buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: [
        Image.network(
          thumbnail,
          fit: BoxFit.cover,
          width: 800,
        ),
        // YoutubePlayer(
        //   controller: YoutubePlayerController(
        //     initialVideoId: youtubeId,
        //     flags: const YoutubePlayerFlags(
        //       autoPlay: false,
        //       mute: false,
        //     ),
        //   ),
        //   showVideoProgressIndicator: true,
        //   progressIndicatorColor: Colors.amber,
        //   progressColors: const ProgressBarColors(
        //     playedColor: Colors.amber,
        //     handleColor: Colors.amberAccent,
        //   ),
        // ),
      ],
    );
  }

  Widget buildNetWorkImage() {
    return Image.network(
      thumbnail,
      fit: BoxFit.cover,
      width: 800,
    );
  }
}
