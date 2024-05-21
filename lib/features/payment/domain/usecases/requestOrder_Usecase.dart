import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/use cases/use case.dart';
import 'package:ecommerce_app/features/payment/domain/entities/order_request_entity.dart';
import 'package:ecommerce_app/features/payment/domain/repositories/payment_repository.dart';

class RequestOrderUsecase
    implements BaseUsecase<OrderRequest, OrderRequestUseCaseParams> {
  final PaymentRepository paymentRepository;

  RequestOrderUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, OrderRequest>> call(
      OrderRequestUseCaseParams params) async {
    return await paymentRepository
        .orderRequest(OrderRequestParams(params.token, params.totlaPrice));
  }
}

class OrderRequestUseCaseParams {
  final String token;
  final String totlaPrice;

  OrderRequestUseCaseParams(this.token, this.totlaPrice);
}
