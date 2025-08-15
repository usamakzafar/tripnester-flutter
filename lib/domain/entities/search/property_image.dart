class PropertyImage {
  final String url;
  final String? categorySlug;

  const PropertyImage({
    required this.url,
    this.categorySlug,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          categorySlug == other.categorySlug;

  @override
  int get hashCode => url.hashCode ^ categorySlug.hashCode;

  @override
  String toString() {
    return 'PropertyImage{url: $url, categorySlug: $categorySlug}';
  }
}
