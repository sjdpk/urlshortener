import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';

class UrlShortnerRequestModel extends UrlShortnerRequestEntity {
  UrlShortnerRequestModel({
    required super.url,
    required super.domain,
    required super.description,
  });
  // from json field
  factory UrlShortnerRequestModel.fromJson(Map<String, dynamic> json) {
    return UrlShortnerRequestModel(
      url: json['url'],
      domain: json['domain'],
      description: json['description'],
    );
  }
}
