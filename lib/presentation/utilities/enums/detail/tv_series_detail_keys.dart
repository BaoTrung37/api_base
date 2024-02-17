enum TvSeriesDetailKeys {
  similar,
  alternativeTitles,
  changes,
  contentRatings,
  credits,
  externalIds,
  images,
  keywords,
  translations,
  videos,
  recommendations,
}

extension TvSeriesDetailKeysExtension on TvSeriesDetailKeys {
  String get title {
    switch (this) {
      case TvSeriesDetailKeys.similar:
        return 'similar';
      case TvSeriesDetailKeys.alternativeTitles:
        return 'alternative_titles';
      case TvSeriesDetailKeys.changes:
        return 'changes';
      case TvSeriesDetailKeys.contentRatings:
        return 'content_ratings';
      case TvSeriesDetailKeys.credits:
        return 'credits';
      case TvSeriesDetailKeys.externalIds:
        return 'external_ids';
      case TvSeriesDetailKeys.images:
        return 'images';
      case TvSeriesDetailKeys.keywords:
        return 'keywords';
      case TvSeriesDetailKeys.translations:
        return 'translations';
      case TvSeriesDetailKeys.videos:
        return 'videos';
      case TvSeriesDetailKeys.recommendations:
        return 'recommendations';
    }
  }
}
