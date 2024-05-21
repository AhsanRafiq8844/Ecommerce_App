import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/payment/domain/entities/new_order_entity.dart';
import 'package:ecommerce_app/features/payment/domain/repositories/payment_repository.dart';

import '../../../../core/use cases/use case.dart';

class CreateNewOrderUsecase
    implements BaseUsecase<NewOrderEntity, CreateNewOrderUsecaseParams> {
  final PaymentRepository paymentRepository;

  CreateNewOrderUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, NewOrderEntity>> call(
      CreateNewOrderUsecaseParams params) async {
    return await paymentRepository.createNewOrder(CreateNewOrderParams(
      params.itemsPrice,
      params.shippingPrice,
      params.totlaPrice,
      params.phone,
      params.pinCode,
      params.address,
      params.city,
      params.country,
      params.status,
      params.id,
      params.state,
      params.orderItems,
    ));
  }
}

class CreateNewOrderUsecaseParams {
  final int itemsPrice;
  final int shippingPrice;
  final int totlaPrice;
  final List<Map<String, dynamic>> orderItems;
  final String phone;
  final String pinCode;
  final String address;
  final String city;
  final String country;
  final String status;
  final String id;
  final String state;

  CreateNewOrderUsecaseParams(
      this.itemsPrice,
      this.shippingPrice,
      this.totlaPrice,
      this.phone,
      this.pinCode,
      this.address,
      this.city,
      this.country,
      this.status,
      this.id,
      this.state,
      this.orderItems);
}
