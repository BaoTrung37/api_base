/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_apple.svg
  SvgGenImage get icApple => const SvgGenImage('assets/icons/ic_apple.svg');

  /// File path: assets/icons/ic_back.svg
  SvgGenImage get icBack => const SvgGenImage('assets/icons/ic_back.svg');

  /// File path: assets/icons/ic_bookmark.svg
  SvgGenImage get icBookmark =>
      const SvgGenImage('assets/icons/ic_bookmark.svg');

  /// File path: assets/icons/ic_bookmark_outline.svg
  SvgGenImage get icBookmarkOutline =>
      const SvgGenImage('assets/icons/ic_bookmark_outline.svg');

  /// File path: assets/icons/ic_download.svg
  SvgGenImage get icDownload =>
      const SvgGenImage('assets/icons/ic_download.svg');

  /// File path: assets/icons/ic_download_outline.svg
  SvgGenImage get icDownloadOutline =>
      const SvgGenImage('assets/icons/ic_download_outline.svg');

  /// File path: assets/icons/ic_error_movie.svg
  SvgGenImage get icErrorMovie =>
      const SvgGenImage('assets/icons/ic_error_movie.svg');

  /// File path: assets/icons/ic_explore.svg
  SvgGenImage get icExplore => const SvgGenImage('assets/icons/ic_explore.svg');

  /// File path: assets/icons/ic_explore_outline.svg
  SvgGenImage get icExploreOutline =>
      const SvgGenImage('assets/icons/ic_explore_outline.svg');

  /// File path: assets/icons/ic_facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icons/ic_facebook.svg');

  /// File path: assets/icons/ic_favorite.svg
  SvgGenImage get icFavorite =>
      const SvgGenImage('assets/icons/ic_favorite.svg');

  /// File path: assets/icons/ic_favorite_outline.svg
  SvgGenImage get icFavoriteOutline =>
      const SvgGenImage('assets/icons/ic_favorite_outline.svg');

  /// File path: assets/icons/ic_google.svg
  SvgGenImage get icGoogle => const SvgGenImage('assets/icons/ic_google.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_home_outline.svg
  SvgGenImage get icHomeOutline =>
      const SvgGenImage('assets/icons/ic_home_outline.svg');

  /// File path: assets/icons/ic_lock.svg
  SvgGenImage get icLock => const SvgGenImage('assets/icons/ic_lock.svg');

  /// File path: assets/icons/ic_mail.svg
  SvgGenImage get icMail => const SvgGenImage('assets/icons/ic_mail.svg');

  /// File path: assets/icons/ic_no_image.svg
  SvgGenImage get icNoImage =>
      const SvgGenImage('assets/icons/ic_no_image.svg');

  /// File path: assets/icons/ic_profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/icons/ic_profile.svg');

  /// File path: assets/icons/ic_profile_grey.svg
  SvgGenImage get icProfileGrey =>
      const SvgGenImage('assets/icons/ic_profile_grey.svg');

  /// File path: assets/icons/ic_profile_outline.svg
  SvgGenImage get icProfileOutline =>
      const SvgGenImage('assets/icons/ic_profile_outline.svg');

  /// File path: assets/icons/ic_refresh.svg
  SvgGenImage get icRefresh => const SvgGenImage('assets/icons/ic_refresh.svg');

  /// File path: assets/icons/ic_retry.svg
  SvgGenImage get icRetry => const SvgGenImage('assets/icons/ic_retry.svg');

  /// File path: assets/icons/ic_star.svg
  SvgGenImage get icStar => const SvgGenImage('assets/icons/ic_star.svg');

  /// File path: assets/icons/ic_star_half.svg
  SvgGenImage get icStarHalf =>
      const SvgGenImage('assets/icons/ic_star_half.svg');

  /// File path: assets/icons/ic_star_outline.svg
  SvgGenImage get icStarOutline =>
      const SvgGenImage('assets/icons/ic_star_outline.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icApple,
        icBack,
        icBookmark,
        icBookmarkOutline,
        icDownload,
        icDownloadOutline,
        icErrorMovie,
        icExplore,
        icExploreOutline,
        icFacebook,
        icFavorite,
        icFavoriteOutline,
        icGoogle,
        icHome,
        icHomeOutline,
        icLock,
        icMail,
        icNoImage,
        icProfile,
        icProfileGrey,
        icProfileOutline,
        icRefresh,
        icRetry,
        icStar,
        icStarHalf,
        icStarOutline
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
