import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/bloc/urlshortener/urlshortener_bloc.dart';
import 'package:urlshortener/src/shortener/presentation/screen/url_shortener_screen.dart';
import 'locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UrlShortenerBloc>(create: (_) => di.sl<UrlShortenerBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'URL Shortener',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UrlShortnerScreen(),
      ),
    );
  }
}
