import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ChangeNotifierProvider<AudioPlayerProvider> audioPlayerProvider = ChangeNotifierProvider<AudioPlayerProvider>((Ref<AudioPlayerProvider> ref) => AudioPlayerProvider());

class AudioPlayerProvider extends ChangeNotifier {

  //constructor
  AudioPlayerProvider() {
    listenToDuration();
  }

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //initially not playing
  bool _isPlaying = false;

  //play the audio
  Future<void> playAudio(String audioPath) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audioPath));
    _isPlaying = true;
    notifyListeners();
  }

  //pause the audio
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  Future<void> resumeAudio() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  Future<void> pauseOrResume() async{
    if (_isPlaying) {
      pauseAudio();
    } else {
      resumeAudio();
    }
    notifyListeners();
  }

  //seek to a specific position
  Future<void> seekTo(Duration position) async{
    await _audioPlayer.seek(position);
  }

  //seek to +10 seconds
  void seekForward() => seekTo(_currentDuration + const Duration(seconds: 10));

  //seek to -10 seconds
  void seekBackward() => seekTo(_currentDuration - const Duration(seconds: 10));

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((Duration newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((Duration newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for audio completion
    _audioPlayer.onPlayerComplete.listen((event) {
      //stop the audio
      _audioPlayer.stop();
      notifyListeners();
    });
  }

  //dispose
  @override
  Future<void> dispose() async {
    await _audioPlayer.dispose();
    super.dispose();
  }

  //GETTERS
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;

  //SETTERS
  set currentDuration(Duration duration) {
    _currentDuration = duration;
    notifyListeners();
  }
}