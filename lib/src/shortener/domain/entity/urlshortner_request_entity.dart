// @desc : UrlShortnerRequestEntity entity
class UrlShortnerRequestEntity {
  final String url;
  final String domain;
  final String description;
  final String? alias;

  UrlShortnerRequestEntity({
    required this.url,
    required this.domain,
    required this.description,
    this.alias,
  });

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "domain": domain,
      "alias": alias,
      "description": description,
    };
  }
}
