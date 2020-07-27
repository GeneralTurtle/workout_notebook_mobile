import 'package:workout_notebook_mobile/models/exercise.dart';

class ExerciseDetailsState {
  Exercise _exercise;

  ExerciseDetailsState(this._exercise);

  Exercise get exercise => _exercise;

  void updateName(String newName) {
    _exercise = _exercise.copyWith(name: newName);
  }

  void incrementNumberOfSeries() {
    _exercise = _exercise.copyWith(
        numberOfSeries: _incrementByOne(_exercise.numberOfSeries));
  }

  void decrementNumberOfSeries() {
    _exercise = _exercise.copyWith(
        numberOfSeries: _decrementByOne(_exercise.numberOfSeries));
  }

  void incrementNumberOfRepetitions() {
    _exercise = _exercise.copyWith(
        numberOfRepetitions: _incrementByOne(_exercise.numberOfRepetitions));
  }

  void decrementNumberOfRepetitions() {
    _exercise = _exercise.copyWith(
        numberOfRepetitions: _decrementByOne(_exercise.numberOfRepetitions));
  }

  void incrementRestTime() {
    _exercise = _exercise.copyWith(
        restTimeInSeconds: _incrementBy30(_exercise.restTimeInSeconds));
  }

  void decrementRestTime() {
    _exercise = _exercise.copyWith(
        restTimeInSeconds: _decrementBy30(_exercise.restTimeInSeconds));
  }

  int _incrementByOne(int number) {
    return _incrementNumberBy(number, 1);
  }

  int _incrementBy30(int number) {
    return _incrementNumberBy(number, 30);
  }

  int _decrementByOne(int number) {
    return _decrementNumberBy(number, 1);
  }

  int _decrementBy30(int number) {
    return _decrementNumberBy(number, 30);
  }

  int _incrementNumberBy(int number, int delta) {
    return number + delta;
  }

  int _decrementNumberBy(int number, int delta) {
    return number - delta;
  }

}
