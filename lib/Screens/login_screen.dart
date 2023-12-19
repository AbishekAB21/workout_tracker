import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/Screens/home_screen.dart';
import 'package:workout_tracker/Screens/splash_screen.dart';
import 'package:workout_tracker/components/login_textfields.dart';
import 'package:workout_tracker/components/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // visiblity
  static const String AdminKey = "visible";
  bool Admin = false;

  // check if Admin or User
  void loginCheck(BuildContext context) async {
    if (usernameController.text == "Admin" &&
        passwordController.text == "AdminPass") {
      // Already logged in then stay logged in until logged out
      var sharedpref = await SharedPreferences.getInstance();
      sharedpref.setBool(SplashScreenState.keylogin, true);

      // // Admin visiblity bool
      var isAdmin = await SharedPreferences.getInstance();
      isAdmin.getBool(AdminKey);
      Admin = isAdmin.setBool(AdminKey, true) as bool;
      Admin = true;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      
    } else if (usernameController.text == "User" &&
        passwordController.text == "UserPass") {
      // Already logged in then stay logged in until logged out
      var sharedpref = await SharedPreferences.getInstance();
      sharedpref.setBool(SplashScreenState.keylogin, true);

      // User visiblity bool
      // var isAdmin = await SharedPreferences.getInstance();
      // isAdmin.getBool(AdminKey);
      // Admin = isAdmin.setBool(AdminKey, false) as bool;
      Admin = false;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
          
    } else if (usernameController.text.isEmpty &&
        passwordController.text.isEmpty) {
      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Credentials cannot be empty"),
        backgroundColor: Colors.red,
        closeIconColor: Colors.white,
        showCloseIcon: true,
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.down,
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
      ));
     
    } else {
      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong username or password"),
        backgroundColor: Colors.red,
        closeIconColor: Colors.white,
        showCloseIcon: true,
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.down,
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
      ));
      
    }
  }

  // Snackbar Function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),

              // logo
              Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(
                height: 50,
              ),

              // welcome text
              Text(
                "Welcome back !",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),

              SizedBox(
                height: 25,
              ),

              // username textfield
              LoginTextfields(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              // password textfield
              LoginTextfields(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // sign in button
              SignInButton(
                /*---User and Admin Sign In---*/
                onTap: () => loginCheck(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
