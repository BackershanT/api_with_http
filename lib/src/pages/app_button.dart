import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const AppButton(this.onPressed, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: InkWell(
        onTap:(){onPressed();} ,
        child: Container(
          child: Text(title),

        ),
      ),
    );
  }
}
