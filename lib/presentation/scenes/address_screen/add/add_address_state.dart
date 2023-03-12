part of 'add_address_bloc.dart';

enum AddAddressStatus { initial, loading, error, done, success }

class AddAddressState extends Equatable {
  final AddAddressStatus status;
  final String message;
  final List<ProvinceModel> provinces;
  final Address? address;

  const AddAddressState._({
    this.status = AddAddressStatus.initial,
    this.message = '',
    this.provinces = const [],
    this.address,
  });

  const AddAddressState.initial() : this._();

  AddAddressState copyWith({
    AddAddressStatus? status,
    String? message,
    List<ProvinceModel>? provinces,
    Address? address,
  }) =>
      AddAddressState._(
        status: status ?? this.status,
        message: message ?? this.message,
        provinces: provinces ?? this.provinces,
        address: address ?? this.address,
      );

  @override
  List<Object> get props => [status, message, provinces, address ?? true];
}
