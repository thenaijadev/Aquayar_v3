import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthUser {
  final String id;
  final String? displayName;
  final String email;
  final String? photoUrl;
  const GoogleAuthUser(
      {required this.photoUrl,
      required this.id,
      required this.email,
      required this.displayName});

  factory GoogleAuthUser.fromGoogle(GoogleSignInAccount user) => GoogleAuthUser(
        id: user.id,
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoUrl,
      );
}
