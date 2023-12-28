import 'package:flutter/material.dart';
import 'package:workout_tracker/Screens/data_collection_widgets/textfields.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page_widgets/edit_alert_box.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page_widgets/header_icon_text.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page_widgets/save_changes_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// Text Editing Controllers
final displaynameController = TextEditingController();
final ageController = TextEditingController();

// Enable editing bool
bool enableEditing = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        EditAlertBox(enableEditing: enableEditing));
              },
              icon: Icon(Icons.edit_rounded))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileIconText(),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: Textfields(
                    controller: displaynameController,
                    hintText: "Display Name",
                    enableEditing: enableEditing,
                  ),
                ),
                Flexible(
                  child: Textfields(
                    controller: ageController,
                    hintText: "Age",
                    enableEditing: enableEditing,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Textfields(
                    controller: displaynameController,
                    hintText: "Weight",
                    enableEditing: enableEditing,
                  ),
                ),
                Flexible(
                  child: Textfields(
                    controller: ageController,
                    hintText: "Height",
                    enableEditing: enableEditing,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: enableEditing,
              child: SaveChangesButton()),
          ],
        ),
      ),
    );
  }
}
