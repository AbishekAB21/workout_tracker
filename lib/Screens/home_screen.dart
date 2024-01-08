import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/screens/bmi_calculator.dart';
import 'package:workout_tracker/screens/diet_page.dart';
import 'package:workout_tracker/screens/login_screen.dart';
import 'package:workout_tracker/screens/protein_calculator.dart';
import 'package:workout_tracker/screens/splash_screen.dart';
import 'package:workout_tracker/screens/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  //bool isAdmin;
  HomeScreen({super.key});

  // Go to BMI Screen
  void gotoBMIScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMICalculator(),
        ));
  }

  // Go to Workout Screen
  void gotoWorkoutScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutScreen(),
        ));
  }

  // // Go to Workout history Screen
  // void gotoWorkoutHistory(BuildContext context) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => WorkoutHistoryPage(),
  //       ));
  // }

  // Go to Diet Plan Screen
  void gotoDietPlanScreen(BuildContext context) async {
    // dynamic isAdmin = await SharedPreferences.getInstance();
    // bool Admin = isAdmin.getBool(LoginScreen.AdminKey);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DietPage(),
        ));
  }

  // Go to Protein Calculator screen
  void gotoProteinCalcScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProteinCalculator(),));
  }

  // Go to Calorie Calculator screen
  void gotoCalorieCalcScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>BMICalculator(),));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://drive.google.com/uc?export=view&id=1TBMeqcbdC3fqdtqlJHah7izdh9m_eIYx',
      'https://drive.google.com/uc?export=view&id=1AXXEIP6m_NE7evcIM0YPkf2u14edJZTR',
      'https://drive.google.com/uc?export=view&id=1yNL87S71xyL7CbAyifBckBeOMHBM6RyX',
      'https://drive.google.com/uc?export=view&id=1G6oZQYIz6mxrfKTjpZ8aRCSuk9cyet8A',
      'https://drive.google.com/uc?export=view&id=1Y3SxEIjEgJk354R6ToQVaxZ35WyvzzAT',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: _homeScreenAppBar(),
      // bottomNavigationBar: CurvedNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Slider
            Container(
                margin: EdgeInsets.only(top: 2),
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                )),
            SizedBox(
              height: 25,
            ),

            // Options for Navigation to Workout Screen
            ListTile(
              onTap: () => gotoWorkoutScreen(context),
              leading: Icon(
                Icons.sports_gymnastics,
                color: Colors.white,
              ),
              title: Text(
                "Workouts",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () => gotoWorkoutScreen(context),
                  icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),

            // Options for Navigation to Diet Plan Screen
            ListTile(
              onTap: () => gotoDietPlanScreen(context),
              leading: Icon(
                Icons.fastfood_rounded,
                color: Colors.white,
              ),
              title: Text(
                "Diet Plan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () => gotoDietPlanScreen(context),
                  icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),

            // Options for Navigation to BMI Calculator Screen
            ListTile(
              onTap: () => gotoBMIScreen(context),
              leading: Icon(
                Icons.calculate_rounded,
                color: Colors.white,
              ),
              title: Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () => gotoBMIScreen(context),
                  icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),

            // Options for Navigation to workout history page
            // Visibility(
            //   visible: true,
            //   child: ListTile(
            //     onTap: () => gotoWorkoutHistory(context),
            //     leading: Icon(
            //       Icons.history_rounded,
            //       color: Colors.black,
            //     ),
            //     title: Text(
            //       "Workout history",
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //     ),
            //     trailing: IconButton(
            //         onPressed: () => gotoWorkoutHistory(context),
            //         icon: Icon(Icons.arrow_forward_ios_outlined)),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // ListTile(
            //   onTap: () => gotoProteinCalcScreen(context),
            //   leading: Icon(
            //     Icons.calculate_rounded,
            //     color: Colors.black,
            //   ),
            //   title: Text(
            //     "Protein  Calculator",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            //   trailing: IconButton(
            //       onPressed: () => gotoProteinCalcScreen(context),
            //       icon: Icon(Icons.arrow_forward_ios_outlined)),
            // ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () => gotoCalorieCalcScreen(context),
              leading: Icon(
                Icons.calculate_rounded,
                color: Colors.black,
              ),
              title: Text(
                "New Home",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () => gotoCalorieCalcScreen(context),
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
            ),
          ],
        ),
      ),
    );
  }
}

class _homeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _homeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      toolbarHeight: 30,
      actions: [
        IconButton(
            onPressed: () {
              // logout function
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.deepPurple,
                    content: Text("Are you sure you want to log out ?",
                        style: TextStyle(color: Colors.white)),
                    title: Text(
                      "Log off",
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      // Yes
                      TextButton(
                          onPressed: () async {
                            // changes shared pref value to false from true
                            var sharedpref =
                                await SharedPreferences.getInstance();
                            sharedpref.setBool(
                                SplashScreenState.keylogin, false);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text("Yes",
                              style: TextStyle(color: Colors.white))),

                      // Cancel
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.white)))
                    ],
                  );
                },
              );
              // // changes shared pref value to false from true
              // var sharedpref = await SharedPreferences.getInstance();
              // sharedpref.setBool(SplashScreenState.keylogin, false);

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => LoginScreen(),
              //     ));
            },
            icon: Icon(Icons.logout_rounded, color: Colors.white,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
