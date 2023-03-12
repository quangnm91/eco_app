// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/model/address_model.dart';

class ShippingAddressTile extends StatelessWidget {
  const ShippingAddressTile({
    super.key,
    required this.addressModel,
  });
  final Address addressModel;

  @override
  Widget build(BuildContext context) {
    print('address modeil --> ');
    print(this.addressModel.province);
    const isDefault = false;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 24,
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 16,
                child: Icon(Icons.location_pin, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(addressModel.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                    text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: "${addressModel.address}, "),
                    TextSpan(text: "${addressModel.province!.name} "),
                    TextSpan(text: addressModel.province!.postalCode)
                  ],
                )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Icon((isDefault ?? false)
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off))
        ],
      ),
    );
  }
}
