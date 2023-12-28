import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/screens/new_homescreen.dart';
import 'package:workout_tracker/screens/splash_screen.dart';
import 'package:workout_tracker/components/login_textfields.dart';
import 'package:workout_tracker/components/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // visiblity
  // static const String AdminKey = "visible";
  // final bool isAdmin = false;
  // bool ifAdmin() {
  //  final String username = usernameController.text;
  //  final String password = passwordController.text;
  //   if (username == "Admin" && password == "AdminPass") {
  //     bool Admin = true;
  //     return Admin;
  //   } else {
  //     bool Admin = false;
  //     return Admin;
  //   }
  // }

  // check if Admin or User
  void loginCheck(BuildContext context) async {
    if (usernameController.text == "Admin" &&
        passwordController.text == "AdminPass") {
      // bool AdminLoggedin = ifAdmin();
      // Already logged in then stay logged in until logged out
      var sharedpref = await SharedPreferences.getInstance();
      sharedpref.setBool(SplashScreenState.keylogin, true);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreenMachTwo()));
    } else if (usernameController.text == "User" &&
        passwordController.text == "UserPass") {
      // bool AdminLoggedin = ifAdmin();
      // Already logged in then stay logged in until logged out
      var sharedpref = await SharedPreferences.getInstance();
      sharedpref.setBool(SplashScreenState.keylogin, true);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreenMachTwo()));
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
      backgroundColor: Colors.deepPurple,
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
                color: Colors.white70,
              ),

              SizedBox(
                height: 50,
              ),

              // welcome text
              Text(
                "Welcome back !",
                style: TextStyle(fontSize: 16, color: Colors.white70),
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
                      style: TextStyle(color: Colors.white70),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First time?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
