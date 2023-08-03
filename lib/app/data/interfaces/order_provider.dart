abstract class OrderProviderInterface {
  Future<Map<String, dynamic>> orderInit(
      {required double waterSize,
      required double longitude,
      required double latitude,
      required String token});
}
