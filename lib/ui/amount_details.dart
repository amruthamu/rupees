import 'package:flutter/material.dart';
import 'package:rupees/constants/constants.dart';
import 'fund_input.dart';

Widget fundDetails(TextEditingController textEditingController) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            Constants.fundTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          FundInput(controller: textEditingController),
        ],
      ),
  );
}

