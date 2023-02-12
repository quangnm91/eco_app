import 'package:flutter/material.dart';

class AddPromotionScreen extends StatelessWidget {
  const AddPromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Add Promo'),
      ),
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        ListView(
          children: [
            _promotionTile(
                title: 'Special 25% Off',
                description: 'Special promo only today!'),
            _promotionTile(
                title: 'Discount 30% Off',
                description: 'New user special promo'),
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

  _promotionTile({
    required String title,
    required String description,
  }) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/coupon_background.jpg'),
                    fit: BoxFit.cover,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 24,
                      child: Icon(Icons.local_activity)),
                ],
              )),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text(description),
              ],
            ),
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
