import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weatherPages/joke/joke_bloc.dart';
import 'package:weather/weatherPages/weatherBlocs/weather_bloc.dart';

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context).add(WeatherGet());
    BlocProvider.of<JokeBloc>(context).add(GetJoke());
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/fon3.jpeg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(child: Text("Погода")),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/fon.jpg"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.green, blurRadius: 2, spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.greenAccent,
                      width: 1,
                    )),
                width: 400,
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      WeatherWiget(),
                      const Center(
                          child: Text(
                        "Шутка дня:",
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w800),
                      )),
                      JokeOfDay(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JokeOfDay extends StatelessWidget {
  const JokeOfDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        if (state is JokeSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.joke.setup}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${state.joke.punchline}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900))
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class WeatherWiget extends StatelessWidget {
  const WeatherWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
      if (state is WeatherSuccess) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "${state.model.name}",
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                    "максимальная температура: ${state.model.main?.tempMax}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "минимальная температура: ${state.model.main?.tempMin}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "сегодня будет ${state.model.weather![0].description}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "ощущается как - ${state.model.main?.feelsLike}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "скорость ветра - ${state.model.wind?.speed}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Желаю тебе хорошего дня!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
              ]),
        );
      }
      ;
      return Column(
        children: const [
          SizedBox(
            height: 105,
          ),
          CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ],
      );
    });
  }
}
