enum MovieDetailKeys {
  alternativeTitles,
  changes,
  credits,
  images,
  keywords,
  lists,
  releases,
  reviews,
  similar,
  translations,
  videos;
}

extension MovieKeysExtension on MovieDetailKeys {
  String get title {
    switch (this) {
      case MovieDetailKeys.alternativeTitles:
        return 'alternative_titles';
      case MovieDetailKeys.changes:
        return 'changes';
      case MovieDetailKeys.credits:
        return 'credits';
      case MovieDetailKeys.images:
        return 'images';
      case MovieDetailKeys.keywords:
        return 'keywords';
      case MovieDetailKeys.lists:
        return 'lists';
      case MovieDetailKeys.releases:
        return 'releases';
      case MovieDetailKeys.reviews:
        return 'reviews';
      case MovieDetailKeys.similar:
        return 'similar';
      case MovieDetailKeys.translations:
        return 'translations';
      case MovieDetailKeys.videos:
        return 'videos';
    }
  }
}
