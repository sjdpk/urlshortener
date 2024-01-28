import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortener/src/shortener/domain/entity/urlshortner_request_entity.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_event.dart';

Form formField(BuildContext context, GlobalKey<FormState> _formKey, TextEditingController _urlController, TextEditingController _alisController) {
  return Form(
    key: _formKey,
    child: Center(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
        children: [
          TextFormField(
            controller: _urlController,

            // add url shoprtner vacidation
            validator: (url) {
              if (url!.isEmpty) {
                return 'Please enter url';
              } else if (!url.startsWith('http://') && !url.startsWith('https://')) {
                return 'Please enter valid url';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Enter URL',
              hintText: 'Enter URL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _urlController,
            decoration: const InputDecoration(
              labelText: 'Enter URL',
              hintText: 'Enter URL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final requestEntity = UrlShortnerRequestEntity(
                  url: _urlController.text.toLowerCase(),
                  description: "Url Shortener Test",
                  domain: "tinyurl.com",
                );
                context.read<UrlShortenerBloc>().add(UrlShortenerEventShortenUrlEvent(requestEntity: requestEntity));
              } else {
                return;
              }
            },
            color: Colors.blue,
            child: const Text(
              "Url Submit",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
