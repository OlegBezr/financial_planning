import 'package:flutter/material.dart';

showRegisterLoginDialog(BuildContext context, Widget registerPage, Widget loginPage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Color(0xff202B3B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        children: <Widget>[
          SimpleDialogOption(
            child: Row(
              children: <Widget>[
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return registerPage;
                  },
                  fullscreenDialog: true
                )
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          SimpleDialogOption(
            child: Row(
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return loginPage;
                  },
                  fullscreenDialog: true
                )
              );
            },
          ),
        ],
      );
    }
  );
}