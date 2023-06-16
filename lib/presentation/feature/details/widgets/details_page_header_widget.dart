import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPageHeaderWidget extends ConsumerStatefulWidget {
  const DetailsPageHeaderWidget({
    required this.thumbnail,
    required this.youtubeLink,
    Key? key,
  }) : super(key: key);
  final String thumbnail;
  final String youtubeLink;
  @override
  ConsumerState<DetailsPageHeaderWidget> createState() =>
      _DetailsPageHeaderWidgetState();
}

class _DetailsPageHeaderWidgetState
    extends ConsumerState<DetailsPageHeaderWidget> {
  late final YoutubePlayerController _controller;
  String _getYoutubeId() {
    if (widget.youtubeLink.contains('v=')) {
      return widget.youtubeLink.split('v=')[1].split(RegExp(r'(&|\?)'))[0];
    } else {
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _getYoutubeId(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
          ),
          items: [
            Image.network(
              widget.thumbnail,
              fit: BoxFit.cover,
              width: 800,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onEnded: (_) {
                _controller.pause();
              },
            ),
          ],
        ),
      ),
    );
  }
}
