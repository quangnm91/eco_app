part of 'address_bloc.dart';

enum AddressStatus { initial, loading, error, done, success }

class AddressState extends Equatable {
  final AddressStatus status;
  final String message;
  final List<Address> addresses;
  const AddressState._({
    this.status = AddressStatus.initial,
    this.message = '',
    this.addresses = const [],
  });
  const AddressState.initial() : this._();

  AddressState copyWith({
    AddressStatus? status,
    String? message,
    List<Address>? addresses,
  }) =>
      AddressState._(
          status: status ?? this.status,
          message: message ?? this.message,
          addresses: addresses ?? this.addresses);

  @override
  List<Object> get props => [status, message, addresses];
}
