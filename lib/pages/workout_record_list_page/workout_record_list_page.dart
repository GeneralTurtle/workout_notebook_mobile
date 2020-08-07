import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/navigators/pages_navigator.dart';
import 'package:workout_notebook_mobile/states/workout_record_list_state.dart';

class WorkoutRecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutRecordListState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Records: '),
      ),
      body: _buildPageBody(state),
    );
  }

  Widget _buildPageBody(WorkoutRecordListState state) {
    return state.hasRecords
        ? _listOfRecords(state)
        : _defaultDisplayMessage();
  }

  ListView _listOfRecords(WorkoutRecordListState state) {
    return ListView.builder(
          itemCount: state.workoutRecords.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final navigator = Provider.of<PagesNavigator>(context, listen: false);
                navigator.toWorkoutRecordPageEdition(context, state.workoutRecords[index]);
              },
              child: Card(
                child: Text('${state.workoutRecords[index].uuid}'),
              ),
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
