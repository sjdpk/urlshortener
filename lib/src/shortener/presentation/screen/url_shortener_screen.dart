import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_state.dart';
import 'package:urlshortener/src/shortener/presentation/widget/data_widget.dart';
import 'package:urlshortener/src/shortener/presentation/widget/form_widget.dart';

class UrlShortnerScreen extends StatelessWidget {
  UrlShortnerScreen({super.key});
// form global key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // url field editing controller
  final TextEditingController _urlController = TextEditingController(text: "https://");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Shortener'),
      ),
      body: BlocBuilder<UrlShortenerBloc, UrlShortenerState>(
        builder: (context, state) {
          if (state is UrlShortenerSuccessState) {
            return dataWidget(state, context);
          }
          return formField(context, _formKey, _urlController);
        },
      ),
    );
  }
}
