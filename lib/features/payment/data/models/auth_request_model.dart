import 'package:ecommerce_app/features/payment/domain/entities/auth_request_entity.dart';

class AuthRequestModel extends AuthRequestEntity {
  const AuthRequestModel({
    required super.token,
  });
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      AuthRequestModel(
        token: json["token"],
      );
}
