import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_compress/video_compress.dart';

class VideoPlayerProvider extends ChangeNotifier {

  VideoPlayerProvider(String videoPath) {
    initializePlayer(videoPath);
  }
  late VideoPlayerController _videoPlayerController;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  bool _isInitialized = false;
  ImageProvider? thumbnailImage;
  bool _isGeneratingThumbnail = false;

  Future<void> initializePlayer(String videoPath) async {
    try {
      _videoPlayerController = VideoPlayerController.asset(videoPath);
      await _videoPlayerController.initialize();
      _totalDuration = _videoPlayerController.value.duration;
      _isInitialized = true;
      _videoPlayerController.setLooping(true); // Enable looping
      _videoPlayerController.play(); // Start playing automatically
      _isPlaying = true;
      await _generateThumbnail();
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

  Future<void> _generateThumbnail() async {
    if (_isGeneratingThumbnail || !_videoPlayerController.value.isInitialized) return;

    _isGeneratingThumbnail = true;
    notifyListeners();

    try {
      // Extract the asset name from the data source
      final String assetPath = _videoPlayerController.dataSource.replaceFirst('asset://', '');
      
      // Create a temporary file from the asset
      final File tempFile = await _extractAssetToTempFile(assetPath);
      
      // Now use that file path for thumbnail generation
      final Uint8List? thumbnailData = await VideoCompress.getByteThumbnail(
        tempFile.path,
        quality: 50, // default(100)
        position: 1000,
      );

      if (thumbnailData != null) {
        thumbnailImage = MemoryImage(thumbnailData);
        print('Thumbnail generated successfully');
      } else {
        print('Thumbnail data is null');
      }
    } catch (e) {
      print('Error generating thumbnail: $e');
    } finally {
      _isGeneratingThumbnail = false;
      notifyListeners();
    }
  }

  // Helper method to extract asset to a temporary file
  Future<File> _extractAssetToTempFile(String assetPath) async {
    try {
      // Load the asset as ByteData
      final ByteData data = await rootBundle.load(assetPath);
      final List<int> bytes = data.buffer.asUint8List();
      
      // Get temporary directory and create a file
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/temp_video_${DateTime.now().millisecondsSinceEpoch}.mp4';
      
      // Write the file
      final File tempFile = File(tempPath);
      await tempFile.writeAsBytes(bytes);
      print('Asset extracted to: ${tempFile.path}');
      return tempFile;
    } catch (e) {
      print('Error extracting asset: $e');
      rethrow;
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
  bool get isGeneratingThumbnail => _isGeneratingThumbnail;
}
