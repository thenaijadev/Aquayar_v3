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
