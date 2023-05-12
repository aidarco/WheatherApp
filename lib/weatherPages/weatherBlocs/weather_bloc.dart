import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/weatherPages/weatherRepo.dart';
import 'package:weather/weatherPages/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.repo}) : super(WeatherInitial()) {
    on<WeatherGet>((event, emit) async {
      try {
        emit(WeatherSuccess(model: await repo.getWeather() ));
      }
      catch (e) {
        emit(WeatherError());
      }
    });
  }
  final weatherRepo repo;
}
