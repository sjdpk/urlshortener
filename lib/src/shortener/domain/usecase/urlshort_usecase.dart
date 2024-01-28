import 'package:urlshortener/src/core/network/data_state.dart';
import 'package:urlshortener/src/shortener/domain/entity/url_shortner_response.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';
import 'package:urlshortener/src/shortener/domain/repository/url_shortner_repo.dart';

class UrlShortnerUseCase {
  final UrlShortnerRepository _repository;
  UrlShortnerUseCase(this._repository);
  // @desc : UrlShortnerUseCase usecase
  Future<DataState<UrlShortnerResponseEntity>> request({required UrlShortnerRequestEntity urlShortnerRequestEntity}) async {
    return await _repository.request(urlShortnerRequestEntity: urlShortnerRequestEntity);
  }
}
