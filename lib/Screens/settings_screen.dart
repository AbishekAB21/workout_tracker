import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 50,
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
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                  color: Colors.white,
                  size: 20,
                )),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(
              Icons.share_rounded,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              "Share",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                )),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(
              Icons.info_rounded,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              "About us",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                )),
            onTap: () {},
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
                            Colors.deepPurpleAccent.shade200),
                        shape: MaterialStateProperty.all(
                            ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(13)))),
                    onPressed: () {},
                    child: Text(
                      "Erase Data",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
