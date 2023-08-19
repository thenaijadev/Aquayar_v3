import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase/supabase.dart';

typedef EitherMap = Future<Either<String, Map<String, dynamic>>>;
typedef EitherString = Future<Either<String, String>>;

typedef EitherAuthUser = Future<Either<String, AquayarAuthUser>>;

typedef EitherUser = Future<Either<String, User>>;
