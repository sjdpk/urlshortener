import 'package:equatable/equatable.dart';
import 'package:urlshortener/src/shortener/domain/entity/url_shortner_response.dart';

class UrlShortenerState extends Equatable {
  @override
  List<Object?> get props => [];
}

// @desc : Url Shortener Loading State
class UrlShortenerInitialState extends UrlShortenerState {}

// @desc : Success State
class UrlShortenerSuccessState extends UrlShortenerState {
  final UrlShortnerResponseEntity urlShortnerResponseEntity;

  UrlShortenerSuccessState({required this.urlShortnerResponseEntity});

  @override
  List<Object?> get props => [
        urlShortnerResponseEntity
      ];
}

// @desc : Error State
class UrlShortenerErrorState extends UrlShortenerState {
  final String message;

  UrlShortenerErrorState({required this.message});

  @override
  List<Object?> get props => [
        message
      ];
}
