part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderEventGetNearestDriver extends OrderEvent {
  const OrderEventGetNearestDriver(
      {required this.token,
      required this.waterSize,
      required this.longitude,
      required this.latitude});
  final String token;
  final double waterSize;
  final double longitude;
  final double latitude;
}
