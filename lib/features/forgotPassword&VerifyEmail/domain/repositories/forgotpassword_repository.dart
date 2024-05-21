import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/entities/forgotpassword_entity.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, ForgotPasswordEntity>> getLink(ForgotParams params);
}

class ForgotParams {
  final String email;
  ForgotParams({
    required this.email,
  });
}
