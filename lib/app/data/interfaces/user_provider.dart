abstract class UserProviderInterface {
  // Future<void> initialize();
  // AuthUser? get currentUser;

  Future<Map<String, dynamic>> updateUser(
      {required String name, required String gender, required String token});
  Future<Map<String, dynamic>> addLoaction(
      {required String address,
      required String city,
      required String name,
      String? tankSize});
}
