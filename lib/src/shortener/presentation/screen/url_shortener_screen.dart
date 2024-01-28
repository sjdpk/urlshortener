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
  final TextEditingController _urlController = TextEditingController(text: "https://facebook.com");
  final TextEditingController _alisController = TextEditingController(text: "apple");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Shortener'),
      ),
      body: BlocConsumer<UrlShortenerBloc, UrlShortenerState>(
        listener: (context, state) {
          if (state is UrlShortenerErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UrlShortenerSuccessState) {
            return dataWidget(state, context);
          }
          return formField(context, _formKey, _urlController, _alisController);
        },
      ),
    );
  }
}
