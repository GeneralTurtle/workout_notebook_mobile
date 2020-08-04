import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/set_record.dart';
import 'package:workout_notebook_mobile/states/workout_record_state.dart';

class WorkoutRecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutRecordState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Record: ${state.workoutName}'),
        actions: _buildActions(state),
      ),
      body: _pageBody(state),
    );
  }

  List<Widget> _buildActions(WorkoutRecordState state) {
    return <Widget>[
      IconButton(
        onPressed: () => state.saveRecord(),
        icon: Icon(Icons.save),
      ),
    ];
  }

  Widget _pageBody(WorkoutRecordState state) {
    return state.hasExercisesRecords
        ? _exerciseRecordsList(state)
        : _defaultDisplay(state);
  }

  Widget _defaultDisplay(WorkoutRecordState state) {
    return Center(
      child: Text('${state.noExerciseDisplayMessage}'),
    );
  }

  Widget _exerciseRecordsList(WorkoutRecordState state) {
    return ListView.builder(
      itemCount: state.exerciseRecords.length,
      itemBuilder: (context, index) =>
          _exerciseRecordItem(state.exerciseRecords[index], state),
    );
  }

  Widget _exerciseRecordItem(
      ExerciseRecord exerciseRecord, WorkoutRecordState state) {
    return Column(
      children: <Widget>[
        Text('${exerciseRecord.exerciseName}'),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exerciseRecord.setRecords.length,
          itemBuilder: (context, index) => _recordLine(
              exerciseRecord.setRecords[index], state, exerciseRecord),
        ),
        Divider(),
      ],
    );
  }

  Widget _recordLine(
    SetRecord setRecord,
    WorkoutRecordState state,
    ExerciseRecord exerciseRecord,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Set ${setRecord.index}: '),
        SizedBox(
          width: 100,
          child: TextField(
            controller:
                TextEditingController(text: '${setRecord.numberOfRepetitions}'),
            onSubmitted: (value) => state.updateNumberOfRepetitions(
              value,
              exerciseRecord.uuid,
              setRecord.uuid,
            ),
          ),
        ),
        Text('reps, '),
        SizedBox(
            width: 100,
            child: TextField(
              controller: TextEditingController(text: '${setRecord.weight}'),
              onSubmitted: (value) => state.updateWeight(
                value,
                exerciseRecord.uuid,
                setRecord.uuid,
              ),
            )),
        Text('kg'),
      ],
    );
  }
}
