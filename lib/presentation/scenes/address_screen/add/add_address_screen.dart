import "package:eco_app/domain/model/province_model.dart";
import "package:eco_app/domain/usecases/address_usecases.dart";
import "package:eco_app/domain/usecases/province_usecases.dart";
import "package:eco_app/injector.dart";
import "package:eco_app/presentation/scenes/address_screen/add/add_address_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:loading_indicator/loading_indicator.dart";
import "package:rxdart/rxdart.dart";

import "../../../../domain/model/address_model.dart";

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final rxProvince = ReplaySubject<int>();
    final addressController = TextEditingController();
    final bloc = AddAddressBloc(
      provinceUsecases: injector<ProvinceUsecases>(),
      addressUsecases: injector<AddressUsecases>(),
    )..add(const InitialEvent());
    return BlocConsumer<AddAddressBloc, AddAddressState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == AddAddressStatus.error) {
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
        if (state.status == AddAddressStatus.success) {
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
        if (state.status == AddAddressStatus.loading) {
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
                onPressed: () => Navigator.of(context).pop()),
            title: const Text("Add a new address"),
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
                children: [
                  const Text("Name"),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Enter a name",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      // focusColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Phone number"),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Enter a phone number",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      // focusColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Province"),
                  const SizedBox(height: 8),
                  StreamBuilder<int>(
                      stream: rxProvince,
                      initialData: 1,
                      builder: (context, snapshot) {
                        return DropdownButton<int>(
                          value: snapshot.data ?? state.provinces.first.id,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(12),
                          onChanged: (int? value) {
                            rxProvince.sink.add(value!);
                          },
                          items: state.provinces.map<DropdownMenuItem<int>>(
                              (ProvinceModel province) {
                            return DropdownMenuItem<int>(
                              value: province.id,
                              child: Text(province.name),
                            );
                          }).toList(),
                        );
                      }),
                  const SizedBox(height: 24),
                  const Text("Address"),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Enter your address",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      // focusColor: Colors.grey.shade100,
                    ),
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
                  onPressed: () {
                    bloc.add(
                      AddNewAddress(
                        addressModel: Address(
                          id: -1,
                          userId: -1,
                          name: nameController.text,
                          address: addressController.text,
                          phoneNumber: phoneNumberController.text,
                          provinceId: rxProvince.values.last,
                          province: null,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Confirm',
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
