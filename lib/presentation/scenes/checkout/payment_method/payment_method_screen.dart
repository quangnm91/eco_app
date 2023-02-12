import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Checkout'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Text('Select the payment method you want to use.')),
              _paymentTile(title: 'My Wallet', icon: Icon(Icons.wallet)),
              _paymentTile(
                title: 'PayPal',
                icon: Image(image: AssetImage('assets/images/ic_paypal.png')),
              ),
              _paymentTile(
                title: 'Google Pay',
                icon:
                    Image(image: AssetImage('assets/images/ic_google_pay.png')),
              ),
              _paymentTile(
                title: 'Apple Pay',
                icon:
                    Image(image: AssetImage('assets/images/ic_apple_pay.png')),
              ),
              _paymentTile(
                title: '.... .... ... ... 4679',
                icon:
                    Image(image: AssetImage('assets/images/ic_mastercard.png')),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
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
              onPressed: () {},
              child: const Text(
                'Confirm Payment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  _paymentTile(
      {required String title, required Widget icon, double? accountBalance}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: icon,
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Visibility(
            visible: accountBalance != null,
            child: Text('\$${accountBalance}'),
          ),
          Expanded(
              flex: 1,
              child: Icon(
                  true ? Icons.radio_button_checked : Icons.radio_button_off))
        ],
      ),
    );
  }
}
