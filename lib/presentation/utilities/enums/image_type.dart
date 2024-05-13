import 'package:api_base/gen/assets.gen.dart';

enum ImageType {
  normal,
  profile,
  media,
}

extension ImageTypeExtension on ImageType {
  SvgGenImage get imageError {
    switch (this) {
      case ImageType.media:
        return Assets.icons.icErrorMovie;
      case ImageType.profile:
        return Assets.icons.icProfileGrey;
      case ImageType.normal:
        return Assets.icons.icNoImage;
    }
  }
}
