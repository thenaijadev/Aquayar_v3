import 'package:aquayar/app/data/models/driver.dart';
import 'package:aquayar/app/data/repos/order_repository.dart';
import 'package:aquayar/app/data/providers/location_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderRepo orderRepo, LocationProvider locationService)
      : super(OrderInitial()) {
    on<OrderEventGetNearestDriver>((event, emit) async {
      emit(OrderStateGetNearestDriverIsLoading());
      final String token = event.token;

      final double waterSize = event.waterSize;
      final String address = event.address;

      try {
        final location = await locationService.getPlace(address);

        final driver = await orderRepo.getNearestDriver(
            waterSize: waterSize,
            longitude: location?["geometry"]["location"]["lng"],
            latitude: location?["geometry"]["location"]["lat"],
            token: token);

        emit(OrderStateGetNearestDriverFound(driver: driver));
      } on DioException catch (e) {
        print(e.response?.data);
        print(e.message);
        emit(OrderStateGetNearestDiverError(error: e.toString()));
      } catch (e) {
        emit(OrderStateGetNearestDiverError(error: e.toString()));
      }
    });

    on<OrderEventGetPrice>((event, emit) async {
      emit(OrderStateIsLoading());
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

        emit(OrderStatePriceRetrieved(
            distance: response["distance"],
            price: response["data"]["price"],
            time: response["time"]));
      } on DioException catch (e) {
        emit(OrderStateGetPriceError(error: e.response?.data));
      } catch (e) {
        emit(OrderStateGetPriceError(error: e.toString()));
      }
    });

    on<OrderEventGetOrderDetails>((event, emit) async {
      emit(OrderStateIsLoading());

      final String token = event.token;
      final String startLocation = event.startLocation;
      final String endLocation = event.endLocation;
      final double price = event.price;
      final double waterSize = event.waterSize;

      final String driver = event.driver;

      try {
        final response = await orderRepo.createOrder(
            driver: driver,
            price: price,
            endLocation: endLocation,
            startLocation: startLocation,
            waterSize: waterSize,
            token: token);
        emit(OrderStateOrderCreated());
      } on DioException catch (e) {
        emit(OrderStateGetPriceError(error: e.response!.data.toString()));
      } catch (e) {
        emit(OrderStateGetPriceError(error: e.toString()));
      }
    });
  }
}
