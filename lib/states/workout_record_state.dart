import 'package:flutter/cupertino.dart';
import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/set_record.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/repositories/workout_record_repository.dart';

class WorkoutRecordState with ChangeNotifier {

  final WorkoutRecordRepository _repository;
  final WorkoutRecord _workoutRecord;

  WorkoutRecord get workoutRecord => _workoutRecord;

  WorkoutRecordState(this._workoutRecord, this._repository);

  String get noExerciseDisplayMessage => 'There are no exercises to display...';

  List<ExerciseRecord> get exerciseRecords => _workoutRecord.exerciseRecords;

  String get workoutName => _workoutRecord.workoutName;

  bool get hasExercisesRecords => exerciseRecords.isNotEmpty;

  void updateNumberOfRepetitions(String value, String exerciseRecordUuid, String setRecordUuid) {
    _updateSetRecord(value, exerciseRecordUuid, setRecordUuid, (record) => record.copyWith(numberOfRepetitions: int.parse(value)));
  }

  void updateWeight(String value, String exerciseRecordUuid, String setRecordUuid) {
    _updateSetRecord(value, exerciseRecordUuid, setRecordUuid, (record) => record.copyWith(weight: double.parse(value)));
  }

  void _updateSetRecord(String value, String exerciseRecordUuid, String setRecordUuid, SetRecord Function(SetRecord) changeSetRecord) {
    final exerciseRecordIndex = _workoutRecord.exerciseRecords.indexWhere((element) => element.uuid == exerciseRecordUuid);
    final exerciseRecord = _workoutRecord.exerciseRecords[exerciseRecordIndex];
    final setRecordIndex = exerciseRecord.setRecords.indexWhere((element) => element.uuid == setRecordUuid);
    final setRecord = changeSetRecord(exerciseRecord.setRecords[setRecordIndex]);
    exerciseRecord.setRecords.replaceRange(setRecordIndex, setRecordIndex + 1, [setRecord]);
    notifyListeners();
  }

  void saveRecord() {
    _repository.saveRecord(_workoutRecord);
  }

}