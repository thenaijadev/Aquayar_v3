part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderStateGetNearestDriverIsLoading extends OrderState {}

class OrderStateGetNearestDriverFound extends OrderState {}

class OrderStatePriceRetrieved extends OrderState {}

class OrderStateGetNearestDiverError extends OrderState {
  const OrderStateGetNearestDiverError({required this.error});
  final String error;
}
