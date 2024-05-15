import 'package: dio/dio.dart';
import 'package: ecommerce_user/core/network/paymentApiProvider.dart';
import 'package: ecommerce_user/core/utilities/endpoints.dart';
import 'package:flutter/rendering.dart';

class PaymentApiProviderImpl implements PaymentAPIProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: paymentsbaseUrlPath,
    receiveDataWhenStatusError: true,
    connectTimeout: 5000,
  ));

  @override 
  Future<Response> get(
    {
      String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? CantelToken,
      int? timeOut,
      bool isMultipart = false})
      async {
        if (timeOut != null){
          dio.options.connectTimeout =timeOut;

        }
        dio.otions.headers = 
      }

    }
  )
}
