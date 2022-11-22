part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  final Welcome data;
  const ApiLoaded(this.data);

  // @override
  // List<Object> get props => [data];
}

class ApiError extends ApiState {
  final String message;
  const ApiError(this.message);
}
