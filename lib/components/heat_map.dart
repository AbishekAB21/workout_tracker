import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:workout_tracker/datetime/date_time.dart';

class WorkouHeatMap extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDateYYYYMMDD;
  WorkouHeatMap({
    super.key,
    required this.datasets,
    required this.startDateYYYYMMDD,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        child: HeatMap(
          startDate: createDatetimeObject(startDateYYYYMMDD),
          endDate: DateTime.now().add(const Duration(days: 0)),
          datasets: datasets,
          colorMode: ColorMode.color,
          defaultColor: Colors.green.shade700,
          textColor: Colors.white,
          showColorTip: false,
          showText: true,
          scrollable: true,
          size: 30,
          colorsets: const {1: Colors.green},
        ));
  }
}
