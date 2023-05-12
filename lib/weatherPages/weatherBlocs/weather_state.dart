part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final weatherModel model;

  WeatherSuccess({required this.model});
}

class WeatherError extends WeatherState {}
