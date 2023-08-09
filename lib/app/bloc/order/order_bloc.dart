import 'package:aquayar/app/data/repos/order_repository.dart';
import 'package:aquayar/app/services/location_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderRepo orderRepo, LocationService locationService)
      : super(OrderInitial()) {
    on<OrderEventGetNearestDriver>((event, emit) async {
      emit(OrderStateGetNearestDriverIsLoading());
      final String token = event.token;

      final double waterSize = event.waterSize;
      final String address = event.address;

      try {
        final location = await locationService.getPlace(address);
        print({"location": location?["geometry"]["location"]["lat"]});

        orderRepo.getNearestDriver(
            waterSize: waterSize,
            longitude: location?["geometry"]["location"]["lng"],
            latitude: location?["geometry"]["location"]["lat"],
            token: token);
        emit(OrderStateGetNearestDriverFound());
      } on DioException catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.response?.data));
      } catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.toString()));
      }
    });

    on<OrderEventGetPrice>((event, emit) async {
      emit(OrderStateGetNearestDriverIsLoading());
      final String token = event.token;
      final double waterSize = event.waterSize;
      final String startLocation = event.startLocation;
      final String endLocation = event.endLocation;

      try {
        final response = await orderRepo.getPrice(
            startLocation: startLocation,
            endLocation: endLocation,
            waterSize: waterSize,
            token: token);
        emit(OrderStatePriceRetrieved(price: response["data"]["price"]));
      } on DioException catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.response?.data));
      } catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.toString()));
      }
    });
  }
}
