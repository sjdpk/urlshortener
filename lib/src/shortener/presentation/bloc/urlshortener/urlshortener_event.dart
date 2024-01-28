// event for the bloc
import 'package:equatable/equatable.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';

abstract class UrlShortenerEvent extends Equatable {
  const UrlShortenerEvent();

  @override
  List<Object> get props => [];
}

// @desc : Url Shortener Event
class UrlShortenerEventShortenUrlEvent extends UrlShortenerEvent {
  final UrlShortnerRequestEntity requestEntity;
  const UrlShortenerEventShortenUrlEvent({required this.requestEntity});

  @override
  List<Object> get props => [
        requestEntity
      ];
}

// @desc : Url Shortener Initial Event
class UrlShortenerInitialEvent extends UrlShortenerEvent {
  const UrlShortenerInitialEvent();
}
