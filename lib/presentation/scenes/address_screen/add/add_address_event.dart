part of 'add_address_bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends AddAddressEvent {
  const InitialEvent();
}

class AddNewAddress extends AddAddressEvent {
  final Address addressModel;
  const AddNewAddress({required this.addressModel});
}
