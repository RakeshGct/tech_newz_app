import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newz/components/components.dart';
import 'package:tech_newz/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
    backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      elevation: 0,
      context: context,
      builder: (context) {
      return MyBottomSheetLayout (
          url: url,
        imageurl: imageurl,
        title: title,
        description: description,
      );
      });
}

Future<void> _launchURL(String url) async {
  final Uri _url = Uri.parse(url);
 if(await canLaunchUrl(_url)) {
   await launchUrl(_url);
 } else {
   throw "Could not launch $_url";
 }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout({super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: modifiedText(
                text: description,
                size: 16,
                color: Colors.white),

          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(text: TextSpan(
              children: <TextSpan> [
                TextSpan(text: "Read Full Article",recognizer: TapGestureRecognizer()
                  ..onTap = () {
                      _launchURL(url);
                  }, style: GoogleFonts.lato (
                  color: Colors.blueAccent.shade700,
                )),
              ]
            )),
          )
        ],
      ),
    );
  }

}