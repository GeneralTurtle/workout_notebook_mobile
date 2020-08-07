import 'package:workout_notebook_mobile/models/records/workout_record.dart';

class WorkoutRecordListState {

  final List<WorkoutRecord> _records;

  WorkoutRecordListState(this._records);

  bool get hasRecords => workoutRecords.isNotEmpty;

  List<WorkoutRecord> get workoutRecords => _records;
}