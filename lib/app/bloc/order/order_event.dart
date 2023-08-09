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
    required this.address,
    required this.price,
    required this.distance,
    required this.longitude,
    required this.latitude,
    required this.driver,
  });
  final String token;
  final double waterSize;
  final String address;
  final double distance;
  final double price;
  final double longitude;
  final double latitude;
  final String driver;
}
