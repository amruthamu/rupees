import 'package:flutter/material.dart';

import '../constants/constants.dart';
class DoneOption extends StatelessWidget {
  const DoneOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDADADA),
      width: double.infinity,
      child: Align(
        alignment: Alignment.topRight,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
            ),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const Text(
              Constants.done,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueAccent,
              ),
            ),
          ),
      ),
    );
  }
}