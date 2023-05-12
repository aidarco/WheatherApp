
import 'package:dio/dio.dart';
import 'jokeModel.dart';

class jokeRepo
{
  Dio dio = Dio();
  
  Future<jokeModel> getJoke() async
  {
    final joke = await dio.get("https://official-joke-api.appspot.com/jokes/programming/random");

    return jokeModel.fromJson(joke.data[0] as Map<String, dynamic>);
  }
      
}