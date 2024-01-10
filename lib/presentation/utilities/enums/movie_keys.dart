enum MovieKeys {
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

extension MovieKeysExtension on MovieKeys {
  String get title {
    if (this == MovieKeys.alternativeTitles) {
      return 'alternative_titles';
    }
    return name;
  }
}
