import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PincodeTextFieldComponent extends StatefulWidget {
  const PincodeTextFieldComponent({super.key, this.hideCharacter});

  final bool? hideCharacter;

  @override
  State<PincodeTextFieldComponent> createState() =>
      _PincodeTextFieldComponentState();
}

class _PincodeTextFieldComponentState extends State<PincodeTextFieldComponent> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autofocus: true,
      controller: controller,
      hideCharacter: widget.hideCharacter ?? false,
      highlight: true,
      highlightColor: Colors.blue,
      defaultBorderColor: Colors.black,
      maxLength: pinLength,
      hasError: hasError,
      // maskCharacter: "•",
      onTextChanged: (text) {
        setState(() {
          hasError = false;
        });
      },
      onDone: (text) {
        print("DONE $text");
        print("DONE CONTROLLER ${controller.text}");
      },
      pinBoxWidth: 80,
      pinBoxHeight: 56,
      hasUnderline: false,
      wrapAlignment: WrapAlignment.spaceAround,
      pinBoxDecoration: (Color borderColor, Color pinBoxColor,
          {double borderWidth = 0, double radius = 0}) {
        return BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        );
      },
      pinTextStyle: TextStyle(fontSize: 22.0),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
      pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
      highlightAnimationBeginColor: Colors.black,
      highlightAnimationEndColor: Colors.white12,
      keyboardType: TextInputType.number,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
