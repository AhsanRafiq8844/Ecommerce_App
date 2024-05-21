import 'package:ecommerce_app/core/network/api_provider.dart';
import 'package:ecommerce_app/core/utilities/endpoints.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/data/models/forgetpassword_models.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/repositories/forgotpassword_repository.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgotPasswordModel> getLink(ForgotParams params);
}

class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  final APIProvider apiProvider;

  ForgetPasswordDataSourceImpl(this.apiProvider);
  @override
  Future<ForgotPasswordModel> getLink(ForgotParams params) async {
    final response = await apiProvider
        .post(endPoint: forgotPasswordEndPoint, data: {"email": params.email});

    return ForgotPasswordModel.fromJson(response.data);
  }
}
