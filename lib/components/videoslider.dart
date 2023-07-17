import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSlider extends StatefulWidget {
  const VideoSlider({super.key});

  @override
  State<VideoSlider> createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  late PageController _pageController;
  VideoPlayerController _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://www.pexels.com/video/interior-design-of-a-modern-house-3773486/'));
  late Future<void> _initializeVideoPlayerFuture;
  final List<String> _videoUrls = [
    'https://drive.google.com/file/d/185nSsNjI9LiuemrG5cTV2iRWphsfkAMy/view?usp=sharing',
    'https://www.pexels.com/video/drone-flying-above-a-pink-hotel-7498650/',
    'https://www.pexels.com/video/interior-design-of-a-modern-house-3773486/',
    // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  ];

  late Duration videoLength;
  late Duration videoPosition;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _initializeVideoController(0);
  }

  void _initializeVideoController(int index) {
    _videoController.dispose();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(_videoUrls[index]),
    );
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    super.initState();
    _videoController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_videoController.value.isPlaying) {
              _videoController.pause();
            } else {
              // If the video is paused, play it.
              _videoController.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
