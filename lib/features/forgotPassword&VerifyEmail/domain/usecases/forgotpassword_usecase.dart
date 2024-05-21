import 'package:datz/dartz.dart';
import 'package:ecommerce_user/core/error/failure.dart';
import 'package:ecommerce_user/core/usercase/usecase.dart';
import 'package:ecommerce_user/features/forgotPassword&VerifyEmail/domain/entities/forgotpassword_entity.dart';
import 'package:ecommerce_user/features/forgotPassword&VerifyEmail/domain/repository/forgotpassword_repository.dart';

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
