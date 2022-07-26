import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';

class RoundedElevatedButton extends StatelessWidget {
  final onPressed;
  final String title;
  final padding;
  RoundedElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.grey,
        primary: Colors.teal,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getHeight(30),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: getHeight(18),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
