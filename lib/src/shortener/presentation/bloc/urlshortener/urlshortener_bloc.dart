// bloc
// import 'dart:async';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:urlshortener/src/core/network/data_state.dart';
import 'package:urlshortener/src/shortener/domain/usecase/urlshort_usecase.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_event.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_state.dart';

class UrlShortenerBloc extends Bloc<UrlShortenerEvent, UrlShortenerState> {
  final UrlShortnerUseCase _shortnerUseCase;
  UrlShortenerBloc(this._shortnerUseCase) : super(UrlShortenerInitialState()) {
    on<UrlShortenerEventShortenUrlEvent>(onUrlShortenerEventShortenUrlEvent);
    on<UrlShortenerInitialEvent>(onUrlShortenerInitialEvent);
  }

  FutureOr<void> onUrlShortenerEventShortenUrlEvent(UrlShortenerEventShortenUrlEvent event, Emitter<UrlShortenerState> emit) async {
    emit(UrlShortenerInitialState());
    final dataState = await _shortnerUseCase.request(urlShortnerRequestEntity: event.requestEntity);
    if (dataState is DataSucessState) {
      emit(UrlShortenerSuccessState(urlShortnerResponseEntity: dataState.data!));
    } else {
      emit(UrlShortenerErrorState(message: dataState.error ?? ""));
    }
  }

  FutureOr<void> onUrlShortenerInitialEvent(UrlShortenerInitialEvent event, Emitter<UrlShortenerState> emit) {
    emit(UrlShortenerInitialState());
  }
}
