import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:dartz/dartz.dart';

typedef EitherMap = Future<Either<String, Map<String, dynamic>>>;

typedef EitherAuthUser = Future<Either<String, AuthUser>>;
