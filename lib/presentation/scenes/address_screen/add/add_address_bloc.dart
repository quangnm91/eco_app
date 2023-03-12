import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_app/domain/usecases/province_usecases.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/model/address_model.dart';
import '../../../../domain/model/province_model.dart';
import '../../../../domain/usecases/address_usecases.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc({
    required this.provinceUsecases,
    required this.addressUsecases,
  }) : super(const AddAddressState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<AddNewAddress>(onAddNewAddress);
  }

  ProvinceUsecases provinceUsecases;
  AddressUsecases addressUsecases;

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(status: AddAddressStatus.loading));
    final result = await provinceUsecases.getProvinces();
    result.fold(
      (failure) => emit(state.copyWith(
          status: AddAddressStatus.error, message: failure.message)),
      (response) => emit(
        state.copyWith(
          status: AddAddressStatus.done,
          provinces: response.data,
          message: 'Get provinces successfully',
        ),
      ),
    );
  }

  FutureOr<void> onAddNewAddress(
      AddNewAddress event, Emitter<AddAddressState> emit) async {
    emit(state.copyWith(status: AddAddressStatus.loading));
    final result =
        await addressUsecases.storeNewAddress(address: event.addressModel);
    result.fold(
      (failure) => emit(state.copyWith(
          status: AddAddressStatus.error, message: failure.message)),
      (response) => emit(
        state.copyWith(
          status: AddAddressStatus.success,
          address: response.data,
          message: 'Store a new address successfully',
        ),
      ),
    );
  }
}
