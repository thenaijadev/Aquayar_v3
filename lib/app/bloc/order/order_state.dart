part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderStateGetNearestDriverIsLoading extends OrderState {}

class OrderStateIsLoading extends OrderState {}

class OrderStateGetNearestDriverFound extends OrderState {
  const OrderStateGetNearestDriverFound({required this.driver});
  final Driver driver;
}

class OrderStatePriceRetrieved extends OrderState {
  const OrderStatePriceRetrieved({
    required this.time,
    required this.price,
    required this.distance,
  });
  final int price;
  final String time;
  final double distance;
}

class OrderStateOrderCreated extends OrderState {}

class OrderStateGetNearestDiverError extends OrderState {
  const OrderStateGetNearestDiverError({required this.error});
  final String error;
}

class OrderStateGetPriceError extends OrderState {
  const OrderStateGetPriceError({required this.error});
  final String error;
}
