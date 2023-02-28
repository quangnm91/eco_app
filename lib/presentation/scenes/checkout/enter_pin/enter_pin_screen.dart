import 'package:flutter/material.dart';

import '../../../widgets/pin_code_text_field_component.dart';

class EnterPinScreen extends StatelessWidget {
  const EnterPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: "");
    String thisText = "";
    int pinLength = 4;
    bool hasError = false;
    String errorMessage;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Enter Your PIN'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80, bottom: 64),
                child: Text('Enter your PIN to confirm payment'),
              ),
              Center(
                child: PincodeTextFieldComponent(
                  hideCharacter: true,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/coupon_background.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 96,
                                      child:
                                          Icon(Icons.shopping_cart, size: 96)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text('Order Successful!',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 16),
                              Text('You have successfully made order'),
                              const SizedBox(height: 16),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  backgroundColor: Colors.black,
                                  minimumSize: const Size.fromHeight(48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                ),
                                child: const Text(
                                  'View Order',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  backgroundColor: Colors.grey.shade300,
                                  minimumSize: const Size.fromHeight(48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                ),
                                child: const Text(
                                  'View E-Receipt',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
