import 'package:blog_app/core/error/failure.dart';
import "package:fpdart/fpdart.dart";

abstract interface class UserCase<SucessType, Params> {
  Future<Either<Failure, SucessType>> call(Params params);
}
