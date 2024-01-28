// @desc : UrlShortnerResponseEntity entity
// fields tiny_url,created_at,alias,domain,url,error
class UrlShortnerResponseEntity {
  final String? tinyUrl;
  final String? createdAt;
  final String? alias;
  final String? domain;
  final String? url;
  final String? error;

  UrlShortnerResponseEntity({
    this.tinyUrl,
    this.createdAt,
    this.alias,
    this.domain,
    this.url,
    this.error,
  });

  //from json  feild
  factory UrlShortnerResponseEntity.fromJson(Map<String, dynamic> json) {
    return UrlShortnerResponseEntity(
      tinyUrl: json["tiny_url"],
      createdAt: json["created_at"],
      alias: json["alias"],
      domain: json["domain"],
      url: json["url"],
      error: json["error"],
    );
  }
}
