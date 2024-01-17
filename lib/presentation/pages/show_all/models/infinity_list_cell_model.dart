import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list.dart';
import 'package:api_base/presentation/widgets/infinite_list/infinite_list_view.dart';

class MovieCell with DataSource<MovieResponse> {
  MovieCell({required this.movie});

  final MovieResponse movie;
  @override
  MovieResponse get getData => movie;
}

class TvShowSCell with DataSource<MovieResponse> {
  TvShowSCell({required this.movie});

  final MovieResponse movie;
  @override
  MovieResponse get getData => movie;
}

class PeopleCell with DataSource<MovieResponse> {
  PeopleCell({required this.movie});

  final MovieResponse movie;
  @override
  MovieResponse get getData => movie;
}
