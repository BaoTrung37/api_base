import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list_view.dart';

class MovieCell with DataSource<MediaResponse> {
  MovieCell({required this.movie});

  final MediaResponse movie;
  @override
  MediaResponse get getData => movie;
}

class TvShowSCell with DataSource<MediaResponse> {
  TvShowSCell({required this.movie});

  final MediaResponse movie;
  @override
  MediaResponse get getData => movie;
}

class PeopleCell with DataSource<MediaResponse> {
  PeopleCell({required this.movie});

  final MediaResponse movie;
  @override
  MediaResponse get getData => movie;
}
