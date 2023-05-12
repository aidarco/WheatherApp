import 'package:flutter/material.dart';
import 'package:weather/weatherPages/joke/jokeRepo.dart';
import 'package:weather/weatherPages/joke/joke_bloc.dart';
import 'package:weather/weatherPages/weatherBlocs/weather_bloc.dart';
import 'package:weather/weatherPages/weatherPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weatherPages/weatherRepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => jokeRepo(),
        ),
        RepositoryProvider(
          create: (context) => weatherRepo(),
        ),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => JokeBloc(repo: RepositoryProvider.of<jokeRepo>(context)),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(repo: RepositoryProvider.of<weatherRepo>(context)),
          ),

        ],
        child: MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.cyan)),
          routes: {
            // "runs": (context) => MarqueeWidgetDemo(),

            "weather": (context) => weather(),
            //   "/json": (context) => Example2(),
          },
          initialRoute: "weather",
        ),
      ),
    );
  }
}