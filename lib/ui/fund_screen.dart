import 'package:flutter/material.dart';
import 'package:rupees/constants/constants.dart';
import 'package:rupees/ui/amount_details.dart';

class FundScreen extends StatefulWidget {
  const FundScreen({Key? key}) : super(key: key);
  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            Constants.fundHead,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: fundDetails(_textEditingController),
    );
  }
}



