import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class AudioPlayerProvider extends ChangeNotifier {

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  AudioPlayerProvider() {
    lisetenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the audio
  void playAudio(String audioPath) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audioPath));
    _isPlaying = true;
    notifyListeners();
  }

  //pause the audio
  void pauseAudio() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resumeAudio() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async{
    if (_isPlaying) {
      pauseAudio();
    } else {
      resumeAudio();
    }
    notifyListeners();
  }

  //seek to a specific position
  void seekTo(Duration position) async{
    await _audioPlayer.seek(position);
  }

  //seek to +10 seconds
  void seekForward() => seekTo(_currentDuration + const Duration(seconds: 10));

  //seek to -10 seconds
  void seekBackward() => seekTo(_currentDuration - const Duration(seconds: 10));

  //listen to duration
  void lisetenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
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