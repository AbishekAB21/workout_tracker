import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownlaodTile extends StatefulWidget {
  final String heading;
  final String path;
  DownlaodTile({super.key, required this.heading, required this.path});

  @override
  State<DownlaodTile> createState() => _DownlaodTileState();
}

class _DownlaodTileState extends State<DownlaodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.shade200,
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      height: 100,
      width: 300,
      child: Column(
        children: [
          Text(
            widget.heading,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(2),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple)),
              onPressed: () async{
              
                final Link = widget.path;
                // Mention file path
                // redirect to url

              if(Link.isEmpty){
                print("No Link Provided");
              }else{
                print("Link has been provided");
              }
              
               await launchUrl(
                 Uri.parse(Link),
                 mode: LaunchMode.externalApplication,
                );

                // _launchUrl();
              
              },
              icon: Icon(
                Icons.download_rounded,
                color: Colors.white70,
              ),
              label: Text("Download",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70)))
        ],
      ),
    );
    
  }

// final Uri _url = Uri.parse('https://flutter.dev');
  
//   Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
}
