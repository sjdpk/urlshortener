// @desc : UrlShortnerRequestEntity entity
class UrlShortnerRequestEntity {
  final String url;
  final String domain;
  final String description;

  UrlShortnerRequestEntity({
    required this.url,
    required this.domain,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "domain": domain,
      "description": description,
    };
  }
}
