abstract class OrderProviderInterface {
  Future<Map<String, dynamic>> getNearestDriver(
      {required double waterSize,
      required double longitude,
      required double latitude,
      required String token});
}