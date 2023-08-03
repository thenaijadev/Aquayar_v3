import 'package:aquayar/app/data/repos/order_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderRepo orderRepo) : super(OrderInitial()) {
    on<OrderEventGetNearestDriver>((event, emit) {
      emit(OrderStateGetNearestDriverIsLoading());
      final String token = event.token;
      final double latitude = event.latitude;
      final double longitude = event.longitude;
      final double waterSize = event.waterSize;

      try {
        orderRepo.getNearestDriver(
            waterSize: waterSize,
            longitude: longitude,
            latitude: latitude,
            token: token);
      } on DioException catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.response?.data));
      } catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.toString()));
      }
    });
  }
}
