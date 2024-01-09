import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/models/profile_model.dart';
import 'package:workout_tracker/screens/data_collection_screen.dart';
import 'package:workout_tracker/screens/settings_screen_pages/about_us_popup.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page.dart';
import 'package:workout_tracker/utils/app_constants.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apptheme.primaryColor,
        appBar: AppBar(
          backgroundColor: apptheme.primaryColor,
          iconTheme: IconThemeData(color: apptheme.foregroundColor),
        ),
        body: FutureBuilder(
          future: Hive.openBox<ProfileModel>(HiveKeys.boxProfile),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Box<ProfileModel> profiles =
                  Hive.box<ProfileModel>(HiveKeys.boxProfile);

              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/settings.png"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Icon(
                      Icons.person_4_rounded,
                      color: apptheme.foregroundColor,
                      size: 25,
                    ),
                    title: Text("Profile", style: apptheme.titleText),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: apptheme.foregroundColor,
                          size: 20,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Icon(
                      Icons.share_rounded,
                      color: apptheme.foregroundColor,
                      size: 25,
                    ),
                    title: Text(
                      "Share",
                      style: TextStyle(
                          color: apptheme.foregroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: apptheme.foregroundColor,
                          size: 20,
                        )),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Icon(
                      Icons.info_rounded,
                      color: apptheme.foregroundColor,
                      size: 25,
                    ),
                    title: Text(
                      "About us",
                      style: TextStyle(
                          color: apptheme.foregroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AboutUsPopUp(),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: apptheme.foregroundColor,
                          size: 20,
                        )),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AboutUsPopUp(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    apptheme.secondaryColor),
                                shape: MaterialStateProperty.all(
                                    ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13)))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: apptheme.primaryColor,
                                  title: Text(
                                    "Erasing All Data",
                                    style: apptheme.titleText,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Are you sure you want to proceed ?",
                                        style: apptheme.buttonTextColor,
                                        // textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "This will all permanantly erase all the data you've entered so far and your progress.",
                                        style: apptheme.buttonTextColor,
                                        // textAlign: TextAlign.start,
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          profiles.clear();

                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          pref.setBool(
                                              SharedPreferenceKeys
                                                  .keyVitalsCollected,
                                              false);

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DataCollectionScreen(),
                                              ));
                                        },
                                        child: Text(
                                          "Erase Data",
                                          style: apptheme.buttonTextColor,
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: apptheme.buttonTextColor,
                                        ))
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Erase Data",
                              style: apptheme.buttonTextColor,
                            )),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
