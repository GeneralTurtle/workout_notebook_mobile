import 'package:workout_notebook_mobile/models/records/workout_record.dart';

class WorkoutRecordRepository {
  final List<WorkoutRecord> _workoutRecords = [];

  WorkoutRecordRepository();

  List<WorkoutRecord> get workoutRecords => _workoutRecords;

  void saveRecord(WorkoutRecord record) {
    _workoutRecords.add(record);
  }

  List<WorkoutRecord> fetchRecords(String workoutUuid) {
    return _workoutRecords.where((element) => element.workoutUuid == workoutUuid).toList();
  }
}
