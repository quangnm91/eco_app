// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_details_bloc.dart';

abstract class CategoryDetailsEvent extends Equatable {
  const CategoryDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CategoryDetailsEvent {
  const InitialEvent();
}

class LoadingEvent extends CategoryDetailsEvent {
  final int largeCategoryId;
  const LoadingEvent({required this.largeCategoryId});
}
