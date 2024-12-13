/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/face-with-tears-of-joy.gif
  AssetGenImage get faceWithTearsOfJoy =>
      const AssetGenImage('assets/gifs/face-with-tears-of-joy.gif');

  /// File path: assets/gifs/grinning-face-with-smiling-eyes.gif
  AssetGenImage get grinningFaceWithSmilingEyes =>
      const AssetGenImage('assets/gifs/grinning-face-with-smiling-eyes.gif');

  /// File path: assets/gifs/kissing-face.gif
  AssetGenImage get kissingFace =>
      const AssetGenImage('assets/gifs/kissing-face.gif');

  /// File path: assets/gifs/slightly-smiling-face.gif
  AssetGenImage get slightlySmilingFace =>
      const AssetGenImage('assets/gifs/slightly-smiling-face.gif');

  /// File path: assets/gifs/smiling-face-with-halo.gif
  AssetGenImage get smilingFaceWithHalo =>
      const AssetGenImage('assets/gifs/smiling-face-with-halo.gif');

  /// File path: assets/gifs/star-struck.gif
  AssetGenImage get starStruck =>
      const AssetGenImage('assets/gifs/star-struck.gif');

  /// List of all assets
  List<AssetGenImage> get values => [
        faceWithTearsOfJoy,
        grinningFaceWithSmilingEyes,
        kissingFace,
        slightlySmilingFace,
        smilingFaceWithHalo,
        starStruck
      ];
}

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

  /// File path: assets/icons/coin-logo.png
  AssetGenImage get coinLogo =>
      const AssetGenImage('assets/icons/coin-logo.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appIcon, appLogoDark, appLogoLight, coinLogo, google];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/aptos-logo.png
  AssetGenImage get aptosLogo =>
      const AssetGenImage('assets/images/aptos-logo.png');

  /// File path: assets/images/onboarding-nft-1.png
  AssetGenImage get onboardingNft1 =>
      const AssetGenImage('assets/images/onboarding-nft-1.png');

  /// File path: assets/images/onboarding-nft-2.png
  AssetGenImage get onboardingNft2 =>
      const AssetGenImage('assets/images/onboarding-nft-2.png');

  /// File path: assets/images/onboarding-nft-3.png
  AssetGenImage get onboardingNft3 =>
      const AssetGenImage('assets/images/onboarding-nft-3.png');

  /// File path: assets/images/onboarding-nft-4.png
  AssetGenImage get onboardingNft4 =>
      const AssetGenImage('assets/images/onboarding-nft-4.png');

  /// File path: assets/images/onboarding-nft-5.png
  AssetGenImage get onboardingNft5 =>
      const AssetGenImage('assets/images/onboarding-nft-5.png');

  /// File path: assets/images/onboarding-nft-6.png
  AssetGenImage get onboardingNft6 =>
      const AssetGenImage('assets/images/onboarding-nft-6.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        aptosLogo,
        onboardingNft1,
        onboardingNft2,
        onboardingNft3,
        onboardingNft4,
        onboardingNft5,
        onboardingNft6
      ];
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    FilterQuality filterQuality = FilterQuality.low,
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
