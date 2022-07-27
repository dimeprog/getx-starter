import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';

class TextAndTextButton extends StatelessWidget {
  final String? text;
  final String? textButtonTitle;
  final onPressed;
  TextAndTextButton({
    Key? key,
    required this.text,
    required this.textButtonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text!,
          style: TextStyle(
            color: Colors.grey,
            fontSize: getHeight(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        FlatButton(
          onPressed: onPressed,
          child: Text(
            textButtonTitle!,
            style: TextStyle(
              color: Colors.teal,
              fontSize: getHeight(18),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
