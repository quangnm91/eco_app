import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseShippingScreen extends StatelessWidget {
  const ChooseShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Shipping Address'),
      ),
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        ListView(
          children: [
            _shippingTile(
                shippingType: 'Economy',
                estimatedArrival: 'Dec 18-19',
                price: 15,
                shippingIcon: Icon(CupertinoIcons.cube_fill)),
            _shippingTile(
                shippingType: 'Regular',
                estimatedArrival: 'Dec 18-19',
                price: 20,
                shippingIcon: Icon(CupertinoIcons.cube_box_fill)),
            _shippingTile(
                shippingType: 'Cargo',
                estimatedArrival: 'Dec 18-19',
                price: 25,
                shippingIcon: Icon(Icons.local_shipping)),
            _shippingTile(
                shippingType: 'Express',
                estimatedArrival: 'Dec 18-19',
                price: 30,
                shippingIcon: Icon(Icons.local_shipping_outlined)),
          ],
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }

  _shippingTile(
      {required String shippingType,
      required String estimatedArrival,
      required int price,
      required Icon shippingIcon}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
                backgroundColor: Colors.black, radius: 24, child: shippingIcon),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shippingType,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('Estimated Arrival, ${estimatedArrival}')
              ],
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
