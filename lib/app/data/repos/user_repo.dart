import 'package:aquayar/app/data/models/updated_user.dart';
import 'package:aquayar/app/data/providers/user_provider.dart';
import 'package:aquayar/utilities/logger.dart';

class UserRepo {
  final UserProvider provider;
  UserRepo(this.provider);

  factory UserRepo.fromDio() => UserRepo(UserProvider());

  Future<UpdatedUser> updateUser(
      {required String name,
      required String gender,
      required String token}) async {
    final response = await provider.updateUser(
      gender: gender,
      token: token,
      name: name,
    );

    return UpdatedUser.fromJson(
      response,
    );
  }

  Future<void> addLocation({
    required String address,
    required String city,
    required String name,
    double? tankSize,
    required String token,
  }) async {
    final response = await provider.addLocation(
        address: address,
        city: city,
        name: name,
        token: token,
        tankSize: tankSize);
    logger.e(response);
  }
}
