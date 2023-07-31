part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventUpdateCustomerLocation extends UserEvent {
  final String name;
  final String city;
  final String address;
  final double? tankSize;
  final String token;

  const UserEventUpdateCustomerLocation(
      {required this.name,
      required this.city,
      required this.address,
      this.tankSize,
      required this.token});
}

class UserEventGetOtp extends UserEvent {
  final String phone;
  final String token;

  const UserEventGetOtp({
    required this.phone,
    required this.token,
  });
}

class UserEventCheckOtp extends UserEvent {
  final int otp;
  final String token;

  const UserEventCheckOtp({
    required this.otp,
    required this.token,
  });
}

class UserEventGetUser extends UserEvent {
  final String? token;

  const UserEventGetUser({
    required this.token,
  });
}

class UserEventGetAllOrders extends UserEvent {
  final String? token;

  const UserEventGetAllOrders({
    required this.token,
  });
}
