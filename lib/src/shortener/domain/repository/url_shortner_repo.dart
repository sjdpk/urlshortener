import 'package:urlshortener/src/core/network/data_state.dart';
import 'package:urlshortener/src/shortener/domain/entity/url_shortner_response.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';

abstract class UrlShortnerRepository {
  Future<DataState<UrlShortnerResponseEntity>> request({required UrlShortnerRequestEntity urlShortnerRequestEntity});
}
