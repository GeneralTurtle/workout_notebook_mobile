import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/repositories/workout_record_repository.dart';

class WorkoutRecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recordRepository = Provider.of<WorkoutRecordRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Records: '),
      ),
      body: _buildPageBody(recordRepository),
    );
  }

  Widget _buildPageBody(WorkoutRecordRepository recordRepository) {
    return recordRepository.workoutRecords.length == 0
        ? _defaultDisplayMessage()
        : _listOfRecords(recordRepository);
  }

  ListView _listOfRecords(WorkoutRecordRepository recordRepository) {
    return ListView.builder(
          itemCount: recordRepository.workoutRecords.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text('${recordRepository.workoutRecords[index].uuid}'),
            );
          },
        );
  }

  Center _defaultDisplayMessage() {
    return Center(
          child: Text('No records to display...'),
        );
  }
}
