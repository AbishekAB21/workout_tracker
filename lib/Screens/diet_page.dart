import 'package:flutter/material.dart';
import 'package:workout_tracker/Screens/calorie_calculator.dart';
import 'package:workout_tracker/Screens/login_screen.dart';
import 'package:workout_tracker/Screens/protein_calculator.dart';
import 'package:workout_tracker/components/bulking_AlertBox.dart';
import 'package:workout_tracker/components/cutting_AlerBox.dart';
import 'package:workout_tracker/data/diet_data.dart';
import 'package:workout_tracker/models/diet.dart';

class DietPage extends StatefulWidget {
  DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

// Admin side visiblity
bool isAdmin = LoginScreen().ifAdmin();

class _DietPageState extends State<DietPage> {
  // Text editing controllers
  final currentWeightController = TextEditingController();
  final desiredWeightController = TextEditingController();

  final cutTip1 = TextEditingController();
  final cutTip2 = TextEditingController();
  final cutTip3 = TextEditingController();
  final cutTip4 = TextEditingController();
  final cutTip5 = TextEditingController();

  // Bulk or Cut bool
  bool bulk = false;
  bool cut = false;
  bool maintain = false;

  // Clear
  void clearCntrl() {
    currentWeightController.clear();
    desiredWeightController.clear();
  }

  // @override
  // void initState() {

  //   super.initState();

  //   Provider.of<DietData>(context, listen: false);
  // }

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

            ElevatedButton(
                style: ButtonStyle(
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
                      cut = true;
                      bulk = false;
                    } else if (currentWeight < desiredWeight) {
                      bulk = true;
                      cut = false;
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
//----------For Admin Only----------
            Visibility(
              visible: true,
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(180, 42)),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurpleAccent.shade200)),
                  onPressed: () {
                    // Show Alert box with text fields
                    // text fields takes new cutTips/plan
                    // passes it using text controller to the funtion
                    // function then saves it to hive
                    // call the cutTips as strings in the text widgets below
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CuttingAlertBox(
                          tip1: cutTip1,
                          tip2: cutTip2,
                          tip3: cutTip3,
                          tip4: cutTip4,
                          tip5: cutTip5,
                        );
                      },
                    );
                  },
                  child: Text('Edit cutting diet details',
                      style: TextStyle(color: Colors.white, fontSize: 12))),
            ),
            Visibility(
              visible: true,
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(180, 42)),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurpleAccent.shade200)),
                  onPressed: () {
                    // Show Alert box with text fields
                    // text fields takes new cutTips/plan
                    // passes it using text controller to the funtion
                    // function then saves it to hive
                    // call the cutTips as strings in the text widgets below

                    showDialog(
                      context: context,
                      builder: (context) {
                        return BulkingAlertBox();
                      },
                    );
                  },
                  child: Text(
                    'Edit bulking diet details',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ),
//----------For Admin Only----------

            SizedBox(
              height: 20,
            ),

            // displaying the suitable diet plan
            // wrap the diet plan with visibility and use the "bulk" and "cut" -
            // bool variables as a toggle function

            // For Bulking
            _bulking(
              bulk: bulk,
            ),

            // For Cutting
            _cutting(cut: cut),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To find out the exact amount of Protein you need,",
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
                  "Use our Protein Calculator.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(180, 42)),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.deepPurpleAccent.shade200)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProteinCalculator(),
                      ));
                },
                child: Text("Protein Calculator")),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To find out the exact amount of Calories you need,",
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
                  "Use our Calorie Calculator.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(180, 42)),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.deepPurpleAccent.shade200)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalorieCalculator(),
                      ));
                },
                child: Text("Calorie Calculator")),

            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

// Cutting instructions
class _cutting extends StatelessWidget {
  const _cutting({
    super.key,
    required this.cut,
  });

  final bool cut;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cut,
      child: Column(
        children: [
          Text(
            "So what you need to do is Cut.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text("For cutting what you have to do is,"),
          Text("increase you protein intake and reduce carbs."),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You can do this by following these methods: ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < DietData().cutDietTips.length; i++)
                  Text("${i + 1}. " + DietData().cutDietTips[i].CutTip1),
                SizedBox(
                  height: 5,
                ),
                Text("2. " /* +  DietData().cutDietTips[1].CutTip2 */),
                SizedBox(
                  height: 5,
                ),
                Text("3. " /* + DietData().CutDietTips[2].CutTip3 */),
                SizedBox(
                  height: 5,
                ),
                Text("4. " /* + DietData().CutDietTips[3].CutTip4 */),
                SizedBox(
                  height: 5,
                ),
                Text("5. " /* + DietData().CutDietTips[4].CutTip5 */),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(
                    "https://images.ctfassets.net/eexbcii1ci83/6OtN4KptCymRLwU8FZahSb/c20dbf0a1ec9fc40441c3c3c3fc7857f/Indian_non-veg_diet_plan_for_weight_loss.jpg",
                    width: 300,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Bulking instructions
class _bulking extends StatelessWidget {
  const _bulking({
    super.key,
    required this.bulk,
  });

  final bool bulk;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: bulk,
      child: Column(
        children: [
          Text(
            "So what you need to do is Bulk.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text("For bulking what you have to do is"),
          Text("increase you calorie intake."),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You can do this by following these methods: ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("1. Eat more often to gain weight."),
                SizedBox(
                  height: 5,
                ),
                Text("2. Choose low volume foods"),
                SizedBox(
                  height: 5,
                ),
                Text("3. Make sure to include protein in each of your meals"),
                SizedBox(
                  height: 5,
                ),
                Text("4. Eat healthy high - calorie food"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(
                    "https://www.maxinutrition.com/Images/meal%20prep.jpg",
                    width: 300,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
