import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



// use youtube_video_player
class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key, required this.video_url})
      : super(key: key);
  final String video_url;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.video_url);
    _videoController = YoutubePlayerController(
        initialVideoId: videoId!, flags: const YoutubePlayerFlags(
      autoPlay: false,
      loop: false,
      disableDragSeek: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _videoController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }
}

// // use Video-Player
// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({Key? key, required this.video_url})
//       : super(key: key);
//   final String video_url;
//
//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _videoController = VideoPlayerController.network("https://api.app.lettutor.com/video/241cb7ff-296e-4d09-90d5-5d5bb80b38d7video1668100735073.mp4")
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _videoController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _videoController.value.isInitialized
//           ? InkWell(
//         onTap: () {
//           setState(() {
//             _videoController.value.isPlaying ? _videoController.pause() : _videoController.play();
//           });
//         },
//             child: AspectRatio(
//                 aspectRatio: _videoController.value.aspectRatio,
//                 child: VideoPlayer(_videoController),
//               ),
//           )
//           : Container(),
//     );
//   }
// }
