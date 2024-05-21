import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/use cases/use case.dart';
import 'package:ecommerce_app/features/payment/domain/entities/auth_request_entity.dart';
import 'package:ecommerce_app/features/payment/domain/repositories/payment_repository.dart';

class RequestAuthUsecase
    implements BaseUsecase<AuthRequestEntity, RequestAuthUseCaseParams> {
  final PaymentRepository paymentRepository;

  RequestAuthUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, AuthRequestEntity>> call(
      RequestAuthUseCaseParams params) async {
    return await paymentRepository
        .requestAuth(RequestAuthParams(params.apiKey));
  }
}

class RequestAuthUseCaseParams {
  final String apiKey;

  RequestAuthUseCaseParams(this.apiKey);
}
