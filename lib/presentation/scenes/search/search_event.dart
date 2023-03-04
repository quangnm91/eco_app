// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends SearchEvent {
  const InitialEvent();
}

class LoadingEvent extends SearchEvent {
  const LoadingEvent();
}

class SubmitEvent extends SearchEvent {
  final String keyword;
  const SubmitEvent({
    required this.keyword,
  });
}
