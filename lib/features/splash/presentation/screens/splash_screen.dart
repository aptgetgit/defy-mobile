import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../app/routes/router.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VideoPlayerController videoController = useMemoized(
        () => VideoPlayerController.asset('assets/videos/splash_video.mp4'),);
    final ValueNotifier<bool> isInitialized = useState(false);
    final ValueNotifier<bool> isVideoCompleted = useState(false);

    useEffect(() {
      Future<void> initializeVideo() async {
        await videoController.initialize();
        isInitialized.value = true;
        await videoController.play();
        await videoController.setLooping(false);
      }

      unawaited(initializeVideo());

      Future<void> handleVideoCompletion() async {
        isVideoCompleted.value = true;
        await Future<void>.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          const DiveInPageRoute().go(context);
        }
      }

      videoController.addListener(() async {
        if (videoController.value.isInitialized &&
            videoController.value.position >= videoController.value.duration) {
          await handleVideoCompletion();
        }
      });

      return () async {
        videoController.removeListener(() {});
        await videoController.dispose();
      };
    }, <Object?>[videoController],);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: isInitialized.value
                ? Column(
                    children: <Widget>[
                      const SizedBox(height: 200),
                      AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: VideoPlayer(videoController),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          const Spacer(),
          if (isVideoCompleted.value)
            const Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: Text(
                'Defy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
