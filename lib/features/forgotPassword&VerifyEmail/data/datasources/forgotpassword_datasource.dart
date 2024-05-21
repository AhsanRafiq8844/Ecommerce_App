import 'package:ecommerce_user/core/network/api_provider.dart';
import 'package:ecommerce_user/core/utilities/endpoints.dart';
import 'package:ecommerce_user/features/forgotPassword&VerifyEmail/data/models/forgotpassword_model.dart';
import 'package:ecommerce_user/features/forgotPassword&VerifyEmail/domain/repositories/forgotpassword.dart';

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
