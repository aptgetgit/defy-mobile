import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider extends ChangeNotifier {

  VideoPlayerProvider(String videoPath) {
    initializePlayer(videoPath);
  }
  late VideoPlayerController _videoPlayerController;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  bool _isInitialized = false;

  Future<void> initializePlayer(String videoPath) async {
    try {
      _videoPlayerController = VideoPlayerController.asset(videoPath);
      await _videoPlayerController.initialize();
      _totalDuration = _videoPlayerController.value.duration;
      _isInitialized = true;
      _videoPlayerController.setLooping(true); // Enable looping
      _videoPlayerController.play(); // Start playing automatically
      _isPlaying = true;
      _videoPlayerController.addListener(() {
        if (_videoPlayerController.value.hasError) {
          print('Video player error: ${_videoPlayerController.value.errorDescription}');
        }
        _currentDuration = _videoPlayerController.value.position;
        _isPlaying = _videoPlayerController.value.isPlaying;
        notifyListeners();
      });
      notifyListeners();
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  void playVideo() async {
    if (!_isInitialized) {
      return;
    }
    await _videoPlayerController.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseVideo() async {
    if (!_isInitialized) {
      return;
    }
    await _videoPlayerController.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeVideo() async {
    if (!_isInitialized) {
      return;
    }
    await _videoPlayerController.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async {
    if (!_isInitialized) {
      return;
    }
    if (_isPlaying) {
      pauseVideo();
    } else {
      resumeVideo();
    }
    notifyListeners();
  }

  void seekTo(Duration position) async {
    if (!_isInitialized) {
      return;
    }
    await _videoPlayerController.seekTo(position);
  }

  void seekForward() {
    if (!_isInitialized) {
      return;
    }
    seekTo(_currentDuration + const Duration(seconds: 10));
  }

  void seekBackward() {
    if (!_isInitialized) {
      return;
    }
    seekTo(_currentDuration - const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  // Getters
  VideoPlayerController get videoPlayerController => _videoPlayerController;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;
  bool get isInitialized => _isInitialized;
}
