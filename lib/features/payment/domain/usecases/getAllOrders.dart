import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/payment/domain/entities/all_orders_entity.dart';
import 'package:ecommerce_app/features/payment/domain/repositories/payment_repository.dart';

import '../../../../core/use cases/use case.dart';

class GetAllOrderesUsecase implements BaseUsecase<AllOrdersEntity, NoParams> {
  final PaymentRepository paymentRepository;

  GetAllOrderesUsecase(this.paymentRepository);

  @override
  Future<Either<Failure, AllOrdersEntity>> call(NoParams params) async {
    return await paymentRepository.getAllOrders(params);
  }
}
