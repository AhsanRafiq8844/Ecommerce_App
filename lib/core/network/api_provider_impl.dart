import 'package:dio/dio.dart';
import 'package:ecommerce_user/core/network/api_provider.dart';
import 'package:ecommerce_user/core/utilities/endpoints.dart';


class APIProviderImpl implements APIProvider{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl; baseUrlPath,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),

  );
  @override 
  Future<Response> get(
    {String? baseUrl,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeout,
    bool isMultipart = false}
  )async {
    if (timeOut != null){
      dio.options.connectTimeout = timeOut;

    }
    dio.options.headers = {
      if(isMultipart)'Content-Type': 'multipart/form-data',
      if(!isMultipart)' Content-Type': 'application/json',
      
    }
  }
}
