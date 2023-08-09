part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderEventGetNearestDriver extends OrderEvent {
  const OrderEventGetNearestDriver(
      {required this.token, required this.waterSize, required this.address});
  final String token;
  final double waterSize;
  final String address;
}

class OrderEventGetPrice extends OrderEvent {
  const OrderEventGetPrice(
    this.startLocation,
    this.endLocation, {
    required this.token,
    required this.waterSize,
  });
  final String token;
  final double waterSize;

  final String startLocation;
  final String endLocation;
}

class OrderEventGetOrderDetails extends OrderEvent {
  const OrderEventGetOrderDetails({
    required this.token,
    required this.waterSize,
    required this.startLocation,
    required this.endLocation,
    required this.price,
    required this.driver,
  });
  final String token;
  final double waterSize;
  final String startLocation;
  final String endLocation;

  final double price;
  final String driver;
}
