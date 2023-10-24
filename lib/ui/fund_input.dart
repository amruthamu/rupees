import 'package:flutter/material.dart';
import 'package:rupees/ui/done_screen.dart';

class FundInput extends StatefulWidget {
  final TextEditingController controller;

  const FundInput({super.key, required this.controller});

  @override
  State<FundInput> createState() => _FundInputState();
}

class _FundInputState extends State<FundInput> {
  FocusNode numberFocusNode = FocusNode();
  @override
  void initState() {
    numberFocusNode.addListener(() {
      bool hasFocus = numberFocusNode.hasFocus;
      if (hasFocus) {
        DoneViewOverlay.showOverlay(context);
      } else {
        DoneViewOverlay.removeOverlay();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          focusNode: numberFocusNode,
          controller: widget.controller,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText:"₹ 0",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          onSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: _handleFundChanges,
        ),
      ),
    );
  }

  void _handleFundChanges(String value) {
    value = value.replaceAll(RegExp(r'[^0-9.₹]'), '');

    String formattedValue = value;
    formattedValue = formattedValue.replaceAll(',', '');
    formattedValue = formattedValue.replaceAll('₹', '');

    if (formattedValue.isNotEmpty) {
      formattedValue = _fundStructure(formattedValue);
    }

    if (formattedValue.isEmpty) { //set cantroller value to empty
      widget.controller.value = const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    } else {
      //If formattedValue is not empty, it sets the widget.
      // controller value to a formatted string that includes the Indian Rupee symbol
      widget.controller.value = TextEditingValue(
        text: '₹$formattedValue',
        selection: TextSelection.collapsed(offset: formattedValue.length + 1),
      );
    }

  }

  String _fundStructure(String number) {
    List<String> divides = number.split('.');
    String integerPart = divides[0].replaceAll(',', '');
    //divides.length > 1 ? '.${divides[1]}' : '';: Checks if there's a decimal part.
    // If present, it keeps the first three decimal places and stores it with a dot.
    //If not, it remains an empty string.
    String decimalPart = divides.length > 1 ? '.${divides[1]}' : '';
    if (decimalPart.length > 3) {
      decimalPart = decimalPart.substring(0, 3);
    }String lastDigit = '';
    if (integerPart.isNotEmpty) {
      lastDigit = integerPart[integerPart.length - 1];
    }
    String output = '';
    int len = integerPart.length - 1;
    int nDigits = 0;
    for (int i = len - 1; i >= 0; i--) {
      output = integerPart[i] + output;
      nDigits++;
      if ((nDigits % 2 == 0) && (i > 0)) {
        //If nDigits is even and there are more digits to process,
        // it adds a comma before the current digit.
        output = ',$output';
      }
    }

    return output + lastDigit + decimalPart;
  }

}