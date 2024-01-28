import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_event.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_state.dart';
import 'package:urlshortener/src/shortener/presentation/widget/textcard.dart';

Padding dataWidget(UrlShortenerSuccessState state, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        textCard(title: "Original Url", data: state.urlShortnerResponseEntity.url ?? "-"),
        textCard(title: "Tiny Url", data: state.urlShortnerResponseEntity.tinyUrl ?? "-"),
        const SizedBox(height: 20),
        Center(
          child: QrImageView(
            data: state.urlShortnerResponseEntity.tinyUrl ?? "-",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            context.read<UrlShortenerBloc>().add(const UrlShortenerInitialEvent());
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.blue,
            child: const Text(
              "ResetForm",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
