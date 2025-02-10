/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app-icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/app-icon.png');

  /// File path: assets/icons/app-logo-dark.png
  AssetGenImage get appLogoDark =>
      const AssetGenImage('assets/icons/app-logo-dark.png');

  /// File path: assets/icons/app-logo-light.png
  AssetGenImage get appLogoLight =>
      const AssetGenImage('assets/icons/app-logo-light.png');

  /// List of all assets
  List<AssetGenImage> get values => [appIcon, appLogoDark, appLogoLight];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dive-in-1.png
  AssetGenImage get diveIn1 =>
      const AssetGenImage('assets/images/dive-in-1.png');

  /// File path: assets/images/dive-in-2.png
  AssetGenImage get diveIn2 =>
      const AssetGenImage('assets/images/dive-in-2.png');

  /// File path: assets/images/dive-in-3.png
  AssetGenImage get diveIn3 =>
      const AssetGenImage('assets/images/dive-in-3.png');

  /// File path: assets/images/dive-in-4.png
  AssetGenImage get diveIn4 =>
      const AssetGenImage('assets/images/dive-in-4.png');

  /// File path: assets/images/dive-in-5.png
  AssetGenImage get diveIn5 =>
      const AssetGenImage('assets/images/dive-in-5.png');

  /// File path: assets/images/dive-in-6.png
  AssetGenImage get diveIn6 =>
      const AssetGenImage('assets/images/dive-in-6.png');

  /// File path: assets/images/dive-in-7.png
  AssetGenImage get diveIn7 =>
      const AssetGenImage('assets/images/dive-in-7.png');

  /// File path: assets/images/dive-in-8.png
  AssetGenImage get diveIn8 =>
      const AssetGenImage('assets/images/dive-in-8.png');

  /// File path: assets/images/grinning-face-with-smiling-eyes.gif
  AssetGenImage get grinningFaceWithSmilingEyes =>
      const AssetGenImage('assets/images/grinning-face-with-smiling-eyes.gif');

  /// File path: assets/images/onboarding-1.gif
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding-1.gif');

  /// File path: assets/images/onboarding-2.gif
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding-2.gif');

  /// File path: assets/images/onboarding-3.gif
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding-3.gif');

  /// File path: assets/images/onboarding-4.gif
  AssetGenImage get onboarding4 =>
      const AssetGenImage('assets/images/onboarding-4.gif');

  /// File path: assets/images/slightly-smiling-face.gif
  AssetGenImage get slightlySmilingFace =>
      const AssetGenImage('assets/images/slightly-smiling-face.gif');

  /// File path: assets/images/star-struck.gif
  AssetGenImage get starStruck =>
      const AssetGenImage('assets/images/star-struck.gif');

  /// List of all assets
  List<AssetGenImage> get values => [
        diveIn1,
        diveIn2,
        diveIn3,
        diveIn4,
        diveIn5,
        diveIn6,
        diveIn7,
        diveIn8,
        grinningFaceWithSmilingEyes,
        onboarding1,
        onboarding2,
        onboarding3,
        onboarding4,
        slightlySmilingFace,
        starStruck
      ];
}

class $AssetsJsGen {
  const $AssetsJsGen();

  /// File path: assets/js/wallet.js
  String get wallet => 'assets/js/wallet.js';

  /// List of all assets
  List<String> get values => [wallet];
}

class $AssetsVideosGen {
  const $AssetsVideosGen();

  /// File path: assets/videos/splash_video.mp4
  String get splashVideo => 'assets/videos/splash_video.mp4';

  /// List of all assets
  List<String> get values => [splashVideo];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsGen js = $AssetsJsGen();
  static const $AssetsVideosGen videos = $AssetsVideosGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
