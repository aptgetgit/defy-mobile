import 'package:defy/features/nft_info/models/audio_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../models/audio.dart';
import '../shared/neu_box.dart';

class NftAudioScreen extends ConsumerWidget {
  const NftAudioScreen({super.key});

  Audio get song => Audio(
      audioName: 'Cyborg',
      authorName: 'Fantasy Ruins',
      nftArtPath: 'assets/images/cyborg2.png',
      audioPath: 'audios/cyborg.mp3');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AudioPlayerProvider audioProvider = ref.watch(audioPlayerProvider);

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

              //album artwork
              NeuBox(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 353,
                      width: 353,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(song.nftArtPath),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(song.audioName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text(song.authorName, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                          const Icon(
                            PhosphorIconsBold.dotsThree,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const Gap(35),

              //song duration progress
              Column(
                children: <Widget>[
                  //song progress bar
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
                        max: audioProvider.totalDuration.inSeconds.toDouble(),
                        value: audioProvider.currentDuration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          audioProvider.seekTo(Duration(seconds: value.toInt()));
                        },
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //start time
                        Text(formatTime(audioProvider.currentDuration), style: const TextStyle(color: Colors.grey)),

                        //shuffe icon

                        //repeat icon

                        //end time
                        Text(formatTime(audioProvider.totalDuration), style: const TextStyle(color: Colors.grey)),
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
                      onPressed: audioProvider.seekBackward,
                    ),
                  ),
                  const Gap(20),

                  //play/pause button
                  Expanded(
                    child: IconButton(
                      iconSize: 50,
                      icon: Icon(audioProvider.isPlaying
                          ? PhosphorIconsFill.pause
                          :  PhosphorIconsFill.play),
                      onPressed: () {
                        if (!audioProvider.isPlaying) {
                          audioProvider.playAudio(song.audioPath);
                        } else {
                          audioProvider.pauseOrResume();
                        }
                      },
                    ),
                  ),
                  const Gap(20),

                  //+15 seconds
                  Expanded(
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.forward_10),
                      onPressed: audioProvider.seekForward,
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

// Create a provider for AudioPlayerProvider
final ChangeNotifierProvider<AudioPlayerProvider> audioPlayerProvider = ChangeNotifierProvider((ChangeNotifierProviderRef<Object?> ref) => AudioPlayerProvider());