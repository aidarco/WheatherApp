import 'package:dio/dio.dart';
import 'package:weather/weatherPages/weather_model.dart';

class weatherRepo {
  Dio dio = Dio();

  Future<weatherModel> getWeather() async {
    final responce = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?q=Kazan&appid=79de33d1f71202eb95366d91da3e93a8&lang=ru&units=metric");
    return weatherModel.fromJson(responce.data);
  }
}
