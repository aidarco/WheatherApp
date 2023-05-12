import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/weatherPages/joke/jokeModel.dart';
import 'package:weather/weatherPages/joke/jokeRepo.dart';

part 'joke_event.dart';

part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc({required this.repo}) : super(JokeInitial()) {
    on<GetJoke>((event, emit) async {
      try {
        emit(JokeSuccess(joke: await repo.getJoke()));
      } catch (e) {
        emit(JokeEror());
        print(e);
      }
    });
  }

  final jokeRepo repo;
}
