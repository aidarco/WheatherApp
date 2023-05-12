part of 'joke_bloc.dart';

@immutable
abstract class JokeState {}

class JokeInitial extends JokeState {}

class JokeSuccess extends JokeState {
  final jokeModel joke ;

  JokeSuccess({required this.joke });
}
class JokeEror extends JokeState {

}