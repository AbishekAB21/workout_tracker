import 'package:flutter/material.dart';
import 'package:workout_tracker/DietPageWidgets/bulking_plan_AlertBox.dart';
import 'package:workout_tracker/DietPageWidgets/cutting_plan_AlertBox.dart';
import 'package:workout_tracker/DietPageWidgets/downlaod_tile.dart';
import 'package:workout_tracker/data/diet_data.dart';

class DietPlannerPage extends StatefulWidget {
  bool admin;
  DietPlannerPage({super.key, required this.admin});

  @override
  State<DietPlannerPage> createState() => _DietPlannerPageState();
}

class _DietPlannerPageState extends State<DietPlannerPage> {
  
  // Text editing controllers
  final currentWeightController = TextEditingController();
  final desiredWeightController = TextEditingController();

  final cutDietPlanController = TextEditingController();
  final bulkDietPlanController = TextEditingController();

  // Bulk or Cut bool
  bool downlaodVisible = false;

  // Heading
  String heading = "";

  // Clear
  void clearCntrl() {
    currentWeightController.clear();
    desiredWeightController.clear();
  }

  // File Path String
  String CutDietPlan = "";
  String BulkDietPlan = "";
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood_rounded,
              size: 50,
              color: Colors.white70,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let us help you in picking the perfect diet plan.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A healthy diet goes a long way in staying fit.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // Asking for current weight and desired weight
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                controller: currentWeightController,
                decoration: InputDecoration(
                    hintText: "Enter your current weight (in kgs)",
                    hintStyle: TextStyle(color: Colors.white54),
                    fillColor: Colors.deepPurpleAccent.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                controller: desiredWeightController,
                decoration: InputDecoration(
                    hintText: "Enter your desired weight (in kgs)",
                    hintStyle: TextStyle(color: Colors.white54),
                    fillColor: Colors.deepPurpleAccent.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54))),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.admin,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent.shade200)),
                      onPressed: () {
                        // Alert box for entering new diet plan file path
                        showDialog(
                            context: context,
                            builder: (context) => CutBox(
                                cutDietPlanController: cutDietPlanController));

                        // CuttingPlanURL
                        // call the variable from hive here and give its data to cutdietplan
                        CutDietPlan = DietData().CuttingPlan;
                      },
                      child: Text(
                        "Edit Cutting Plan File",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: widget.admin,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent.shade200)),
                      onPressed: () {
                        // Alert box for entering new diet plan file path
                        showDialog(
                          context: context,
                          builder: (context) => BulkBox(
                              bulkDietPlanController: bulkDietPlanController),
                        );

                        // BulkingPlanURL
                        // call the variable from hive here and give its data to Bulkplan
                        BulkDietPlan = DietData().BulkingPlan;
                      },
                      child: Text(
                        "Edit Bulking Plan File",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    fixedSize: MaterialStateProperty.all(Size(150, 42)),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.deepPurpleAccent.shade200)),
                onPressed: () {
                  String CurrentWeight = currentWeightController.text;
                  String DesiredWeight = desiredWeightController.text;

                  double currentWeight = double.parse(CurrentWeight);
                  double desiredWeight = double.parse(DesiredWeight);

                  setState(() {
                    if (currentWeight > desiredWeight) {
                      // Filepath = Cutting diet plan file URL
                      filePath = CutDietPlan;

                      if (CutDietPlan.isEmpty) {
                        print("Empty");
                      } else {
                        print(CutDietPlan);
                      }

                      downlaodVisible = true;
                      heading = "Download Cutting Diet Plan";
                    } else if (currentWeight < desiredWeight) {
                      // Filepath = Bulking diet plan file URL
                      filePath = BulkDietPlan;

                      if (BulkDietPlan.isEmpty) {
                        print("Empty");
                      } else {
                        print(BulkDietPlan);
                      }

                      downlaodVisible = true;
                      heading = "Download Bulking Diet Plan";
                    } else {
                      // SnackBar
                    }

                    clearCntrl();
                  });
                },
                child: Text(
                  "Get diet plan",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),

            Visibility(
                visible: downlaodVisible,
                child: DownlaodTile(heading: heading, path: filePath)),
          ],
        ),
      ),
    );
  }
}
