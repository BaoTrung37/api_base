import 'package:api_base/gen/assets.gen.dart';

enum ImageType {
  normal,
  profile,
  movie,
}

extension ImageTypeExtension on ImageType {
  SvgGenImage get imageError {
    switch (this) {
      case ImageType.movie:
        return Assets.icons.icApple;
      case ImageType.profile:
        return Assets.icons.icProfileGrey;
      case ImageType.normal:
        return Assets.icons.icNoImage;
    }
  }
}
