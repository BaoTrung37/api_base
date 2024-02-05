enum TvSeriesDetailKeys {
  similar,
}

extension TvSeriesDetailKeysExtension on TvSeriesDetailKeys {
  String get title {
    switch (this) {
      case TvSeriesDetailKeys.similar:
        return 'similar';
    }
  }
}
