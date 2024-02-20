import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list_view.dart';

class MovieCell with DataSource<MediaResponse> {
  MovieCell({required this.media});

  final MediaResponse media;
  @override
  MediaResponse get getData => media;
}

class TvSeriesCell with DataSource<MediaResponse> {
  TvSeriesCell({required this.media});

  final MediaResponse media;
  @override
  MediaResponse get getData => media;
}

class PeopleCell with DataSource<MediaResponse> {
  PeopleCell({required this.people});

  final MediaResponse people;
  @override
  MediaResponse get getData => people;
}
