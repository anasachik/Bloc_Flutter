import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  SubmitButton(this.onPressed, this.text);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.trending_flat),
            SizedBox(width: 10),
            Text(
              text,
              style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand"),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      ),
    );
  }
}
