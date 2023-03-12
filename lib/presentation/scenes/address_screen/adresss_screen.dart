import 'package:eco_app/domain/usecases/address_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../domain/model/address_model.dart';
import '../../../injector.dart';
import '../../../routes.dart';
import '../../widgets/shipping_address_tile.dart';
import 'address_bloc.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = AddressBloc(addressUsecases: injector<AddressUsecases>())
      ..add(const InitialEvent());
    return BlocConsumer<AddressBloc, AddressState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == AddressStatus.error) {
          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('ERROR'),
                content: Text(state.message),
                actions: [
                  TextButton(
                      child: const Text('Ok'),
                      onPressed: () => Navigator.of(context).pop())
                ],
              );
            },
          );
        }
        if (state.status == AddressStatus.success) {
          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('SUCCESS'),
                content: Text(state.message),
                actions: [
                  TextButton(
                      child: const Text('Ok'),
                      onPressed: () => Navigator.of(context).pop())
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state.status == AddressStatus.loading) {
          return const LoadingIndicator(
              indicatorType: Indicator.ballScale,
              colors: [Colors.blueAccent],
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white);
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text('Shipping Address'),
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ListView(
                children: state.addresses.map<Widget>((address) {
                  return ShippingAddressTile(addressModel: address);
                }).toList()
                  ..add(
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.addAddress);
                        },
                        child: const Text(
                          'Add New Address',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
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
                    'Select',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
