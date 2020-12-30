import 'package:financial_planning/services/launch_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showContactDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Color(0xff202B3B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          'Communication options',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white
          ),
        ),
        children: <Widget>[
          SimpleDialogOption(
            child: Row(
              children: <Widget>[
                // phone_arrow_up_right
                Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 5.0,),
                Text(
                  'Call us',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onPressed: () {
              launchURL('tel://(925) 378-5000');
            },
          ),
          SimpleDialogOption(
            child: Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.envelope,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 5.0,),
                Text(
                  'Email us',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onPressed: () {
              var emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'info@grantprivate.com',
                queryParameters: {
                  'subject': 'TurnKey tools'
                }
              );
              launchURL(emailLaunchUri.toString());
            },
          ),
          SimpleDialogOption(
            child: Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.square_arrow_up,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 5.0,),
                Text(
                  'More options',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onPressed: () {
              launchURL('https://grantprivate.com/contact/');
            },
          ),
        ],
      );
    }
  );
}