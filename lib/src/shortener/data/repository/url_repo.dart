import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:urlshortener/src/core/network/data_state.dart';
import 'package:urlshortener/src/shortener/data/datasource/remote/urlshort_source.dart';
import 'package:urlshortener/src/shortener/domain/entity/url_shortner_response.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';
import 'package:urlshortener/src/shortener/domain/repository/url_shortner_repo.dart';

class UrlShortDataSourceImpl implements UrlShortnerRepository {
  final RemoteUrlShortDataSourceImpl _dataSourceImpl;
  const UrlShortDataSourceImpl(this._dataSourceImpl);

  @override
  Future<DataState<UrlShortnerResponseEntity>> request({required UrlShortnerRequestEntity urlShortnerRequestEntity}) async {
    try {
      final response = await _dataSourceImpl.request(urlShortnerRequestEntity: urlShortnerRequestEntity);
      log("Response is ${response.statusCode}");
      final jsonData = jsonDecode(response.body)['data'];
      final UrlShortnerResponseEntity urlShortnerRequestModel = UrlShortnerResponseEntity.fromJson(jsonData);
      return DataSucessState(urlShortnerRequestModel);
    } on SocketException {
      return const DataErrorState("No Internet Connection");
    } catch (e) {
      log("THis si executed $e");

      return DataErrorState(e.toString());
    }
  }
}
