// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:eco_app/domain/model/address_model.dart';

import '../../../domain/usecases/address_usecases.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc({required this.addressUsecases})
      : super(const AddressState.initial()) {
    on<InitialEvent>(onInitialEvent);
  }

  final AddressUsecases addressUsecases;

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(status: AddressStatus.loading));

    final result = await addressUsecases.getAddresses();
    result.fold(
      (failure) => emit(
        state.copyWith(status: AddressStatus.error, message: failure.message),
      ),
      (response) => emit(
        state.copyWith(
            status: AddressStatus.done,
            addresses: response.data,
            message: 'Get addresses successfully'),
      ),
    );
  }
}
