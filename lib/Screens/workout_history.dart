import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/data/workout_data.dart';

class WorkoutHistoryPage extends StatefulWidget {
  const WorkoutHistoryPage({super.key});

  @override
  State<WorkoutHistoryPage> createState() => _WorkoutHistoryPageState();
}

class _WorkoutHistoryPageState extends State<WorkoutHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Workout History"),
              toolbarHeight: 60,
              centerTitle: true,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                        tileColor: Colors.grey.shade400,
                        title: Text(
                          value.workoutList[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  leading: Icon(Icons.history_toggle_off, color: Colors.black,),
                  trailing: Text(DateTime.now().toString()),
                      ),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: WorkoutData().db.readFromDatabase().length
                )
                )
                );
  }
}
