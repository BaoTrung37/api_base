import 'package:api_base/presentation/utilities/enums/api_data_type.dart';

enum ApiMovieType {
  popular,
  playingNow,
  similar,
}

extension ApiMovieTypeExtension on ApiMovieType {
  ApiDataType get dataType => ApiDataType.movie;
}
