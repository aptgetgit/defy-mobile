/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/loading-indicator.json
  String get loadingIndicator => 'assets/animations/loading-indicator.json';

  /// List of all assets
  List<String> get values => [loadingIndicator];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/amnis.png
  AssetGenImage get amnis => const AssetGenImage('assets/icons/amnis.png');

  /// File path: assets/icons/app-icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/app-icon.png');

  /// File path: assets/icons/app-logo-dark.png
  AssetGenImage get appLogoDark =>
      const AssetGenImage('assets/icons/app-logo-dark.png');

  /// File path: assets/icons/app-logo-light.png
  AssetGenImage get appLogoLight =>
      const AssetGenImage('assets/icons/app-logo-light.png');

  /// File path: assets/icons/aptos-logo.png
  AssetGenImage get aptosLogo =>
      const AssetGenImage('assets/icons/aptos-logo.png');

  /// File path: assets/icons/aries.png
  AssetGenImage get aries => const AssetGenImage('assets/icons/aries.png');

  /// File path: assets/icons/binance.png
  AssetGenImage get binance => const AssetGenImage('assets/icons/binance.png');

  /// File path: assets/icons/coinbase.png
  AssetGenImage get coinbase =>
      const AssetGenImage('assets/icons/coinbase.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/gui-inu.png
  AssetGenImage get guiInu => const AssetGenImage('assets/icons/gui-inu.png');

  /// File path: assets/icons/kraken.png
  AssetGenImage get kraken => const AssetGenImage('assets/icons/kraken.png');

  /// File path: assets/icons/staking-default.png
  AssetGenImage get stakingDefault =>
      const AssetGenImage('assets/icons/staking-default.png');

  /// File path: assets/icons/usdc.png
  AssetGenImage get usdc => const AssetGenImage('assets/icons/usdc.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        amnis,
        appIcon,
        appLogoDark,
        appLogoLight,
        aptosLogo,
        aries,
        binance,
        coinbase,
        google,
        guiInu,
        kraken,
        stakingDefault,
        usdc
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cosmos-bg.png
  AssetGenImage get cosmosBg =>
      const AssetGenImage('assets/images/cosmos-bg.png');

  /// File path: assets/images/rocket.png
  AssetGenImage get rocket => const AssetGenImage('assets/images/rocket.png');

  /// List of all assets
  List<AssetGenImage> get values => [cosmosBg, rocket];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
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
    bool gaplessPlayback = false,
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
