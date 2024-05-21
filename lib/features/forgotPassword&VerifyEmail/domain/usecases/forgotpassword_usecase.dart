import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/use%20cases/use%20case.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/entities/forgotpassword_entity.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/repositories/forgotpassword_repository.dart';

class ForgotPassUsecase
    implements BaseUsecase<ForgotPasswordEntity, ForgetPasswordUsecaseParams> {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPassUsecase(this.forgotPasswordRepo);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> call(
      ForgetPasswordUsecaseParams params) async {
    return await forgotPasswordRepo.getLink(ForgotParams(email: params.email));
  }
}

class ForgetPasswordUsecaseParams {
  final String email;

  ForgetPasswordUsecaseParams(this.email);
}
