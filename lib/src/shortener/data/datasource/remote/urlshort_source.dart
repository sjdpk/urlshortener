import 'package:urlshortener/src/config/api/api_collection.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';
import 'package:http/http.dart' as http;

abstract class RemoteUrlShortDataSource {
  Future<http.Response> request({required UrlShortnerRequestEntity urlShortnerRequestEntity});
}

class RemoteUrlShortDataSourceImpl extends RemoteUrlShortDataSource {
  final http.Client _client;
  RemoteUrlShortDataSourceImpl(this._client);

  @override
  Future<http.Response> request({required UrlShortnerRequestEntity urlShortnerRequestEntity}) async {
    final response = await _client.post(
      Uri.parse(baseUrl + createUrl),
      headers: {
        "Authorization": "Bearer JodgVaBnvlYAqCYJBW9kNhgsxaXs73rDumSN15PbynpxDYOHoYDebJepzrU6"
      },
      body: urlShortnerRequestEntity.toJson(),
    );
    return response;
  }
}
