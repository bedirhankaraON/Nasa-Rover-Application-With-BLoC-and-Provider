part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}


class FilterLoading extends FilterState {}

class FilterError extends FilterState {
  final String message;

  FilterError(this.message);
}

class FilterResult extends FilterState {
  final Iterable<ResponseModel> data;

  FilterResult(this.data);
}
