import 'package:defy/features/nft_info/models/video_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:video_player/video_player.dart';

import '../models/video.dart';
import '../shared/neu_box.dart';

// Create a provider for VideoPlayerProvider
final videoPlayerProvider = ChangeNotifierProvider.family<VideoPlayerProvider, String>((ref, videoPath) => VideoPlayerProvider(videoPath));

class NftVideoScreen extends ConsumerStatefulWidget {
  const NftVideoScreen({super.key});

  @override
  ConsumerState<NftVideoScreen> createState() => _NftVideoScreenState();
}

class _NftVideoScreenState extends ConsumerState<NftVideoScreen> {
  Video get video => Video(
      videoName: 'Cyborg Video',
      authorName: 'Fantasy Ruins',
      videoPath: 'assets/videos/nft_video.mp4');

  @override
  Widget build(BuildContext context) {
    final VideoPlayerProvider videoProvider = ref.watch(videoPlayerProvider(video.videoPath));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
          child: Column(
            children: <Widget>[
              //app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      PhosphorIconsBold.caretLeft,
                      size: 24,
                    ),
                  ),
                  Icon(
                    PhosphorIconsRegular.star,
                    size: 24,
                  )
                ],
              ),
              const Gap(25),

              //video
              NeuBox(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: videoProvider.isInitialized
                          ? GestureDetector(
                              onTap: () {
                                videoProvider.pauseOrResume();
                              },
                              child: VideoPlayer(videoProvider.videoPlayerController),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(video.videoName,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(video.authorName,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenVideoScreen(videoPath: video.videoPath),
                                ),
                              );
                            },
                            child: const Icon(
                              PhosphorIconsBold.cornersOut,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const Gap(45),

              //video duration progress
              Column(
                children: <Widget>[
                  //video progress bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SliderTheme(
                      data: SliderThemeData(
                        overlayShape: SliderComponentShape.noOverlay,
                        trackHeight: 14,
                        trackShape: RectangularSliderTrackShape(),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: videoProvider.totalDuration.inSeconds.toDouble(),
                        value: videoProvider.currentDuration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          videoProvider.seekTo(Duration(seconds: value.toInt()));
                        },
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //start time
                        Text(formatTime(videoProvider.currentDuration),
                            style: const TextStyle(color: Colors.grey)),

                        //shuffe icon

                        //repeat icon

                        //end time
                        Text(formatTime(videoProvider.totalDuration),
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(30),

              //playback controls
              Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.replay_10),
                      onPressed: videoProvider.seekBackward,
                    ),
                  ),
                  const Gap(20),

                  //play/pause button
                  Expanded(
                    child: IconButton(
                      iconSize: 50,
                      icon: Icon(videoProvider.isPlaying
                          ? PhosphorIconsFill.pause
                          : PhosphorIconsFill.play),
                      onPressed: () {
                        videoProvider.pauseOrResume();
                      },
                    ),
                  ),
                  const Gap(20),

                  //+15 seconds
                  Expanded(
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.forward_10),
                      onPressed: videoProvider.seekForward,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //format duration
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }
}

class FullScreenVideoScreen extends ConsumerWidget {
  const FullScreenVideoScreen({Key? key, required this.videoPath}) : super(key: key);

  final String videoPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VideoPlayerProvider videoProvider = ref.watch(videoPlayerProvider(videoPath));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack( // Use Stack to overlay the button
        children: [
          Center( // Center the video
            child: videoProvider.isInitialized
                ? GestureDetector(
                    onTap: () {
                      videoProvider.pauseOrResume();
                    },
                    child: AspectRatio(
                      aspectRatio: videoProvider.videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(videoProvider.videoPlayerController),
                    ),
                  )
                : const CircularProgressIndicator(color: Colors.white),
          ),
          Positioned(
            top: 52,
            left: 12,
            child: IconButton(
              icon: const Icon(PhosphorIconsBold.caretLeft, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}