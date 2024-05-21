// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
