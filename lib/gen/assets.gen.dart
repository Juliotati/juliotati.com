/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAppImagesGen {
  const $AssetsAppImagesGen();

  /// File path: assets/app_images/julio_stare.png
  AssetGenImage get julioStare =>
      const AssetGenImage('assets/app_images/julio_stare.png');

  /// File path: assets/app_images/juliotati.png
  AssetGenImage get juliotati =>
      const AssetGenImage('assets/app_images/juliotati.png');

  /// File path: assets/app_images/kingdom_no_bg.png
  AssetGenImage get kingdomNoBg =>
      const AssetGenImage('assets/app_images/kingdom_no_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [julioStare, juliotati, kingdomNoBg];
}

class $AssetsCarsGen {
  const $AssetsCarsGen();

  /// File path: assets/cars/116_sportsM.webp
  AssetGenImage get a116SportsM =>
      const AssetGenImage('assets/cars/116_sportsM.webp');

  /// File path: assets/cars/toyota_gr_86_trueno.png
  AssetGenImage get toyotaGr86Trueno =>
      const AssetGenImage('assets/cars/toyota_gr_86_trueno.png');

  /// File path: assets/cars/truenoAE86.png
  AssetGenImage get truenoAE86 =>
      const AssetGenImage('assets/cars/truenoAE86.png');

  /// List of all assets
  List<AssetGenImage> get values => [a116SportsM, toyotaGr86Trueno, truenoAE86];
}

class Assets {
  const Assets._();

  static const $AssetsAppImagesGen appImages = $AssetsAppImagesGen();
  static const $AssetsCarsGen cars = $AssetsCarsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
