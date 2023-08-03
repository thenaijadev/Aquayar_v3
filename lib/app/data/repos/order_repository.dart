// ignore_for_file: unused_local_variable

import 'package:aquayar/app/data/interfaces/order_provider.dart';
import 'package:aquayar/app/data/models/updated_user.dart';
import 'package:aquayar/app/data/providers/order_provider.dart';

class OrderRepo {
  final OrderProviderInterface provider;
  OrderRepo(this.provider);

  factory OrderRepo.fromDio() => OrderRepo(OrderProvider());

  Future<UpdatedUser> updateUser(
      {required double waterSize,
      required double longitude,
      required double latitude,
      required String token}) async {
    final response = await provider.orderInit(
        waterSize: waterSize,
        longitude: longitude,
        latitude: latitude,
        token: token);

    return UpdatedUser.fromJson(
      response,
    );
  }
}
