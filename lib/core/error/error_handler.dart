import 'package:dio/dio.dart';
import 'package:ecommerce_user/core/error/failure.dart';
import 'package:ecommerce_user/core/utilities/string.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNEL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNEL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return const ServerFailure(
          ResponseMessage.Bad_Request,
        );
      case DataSource.FORBIDDEN:
        return const ServerFailure(
          ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTHORISED:
        return const ServerFailure(ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return const ServerFailure(ResponseMessage.NOT_FOUND);
      case DataSource.INTERNEL_SERVER_ERROR:
        return const ServerFailure(ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return const ServerFailure(ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return const ServerFailure(ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return const ServerFailure(ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return const ServerFailure(ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return const ServerFailure(ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return const ServerFailure(ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return const ServerFailure(ResponseMessage.DEFAULT);
        default:
        return const ServerFailure(ResponseMessage.default);
    }
  }
}

class ResponseCode{
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UN_AUTHORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int DEFAULT = -1 ;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT =  -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage{
  static const String SUCCESS = AppStrings.SUCCESS;
  static const String NO_CONTENT = AppStrings.NO_CONTENT;
  static const String BAD_REQUEST = AppStrings.BAD_REQUEST;
  static const String FORBIDDEN = AppsStrings.Fforbiddenerror;
  static const String UN_AUTHORISED = AppStrings.unauthorisedError;
  static const String NOT_FOUND = AppStrings.notfoundError;
  static const String INTERNAL_SERVER_ERROR = AppStrings.internalserverError;
  static const String DEFAULT = AppStrings.defaultError;
  static const String CONNECT_TIMEOUT = AppStrings.connecttimeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECEIVE_TIMEOUT = AppStrings.receiveError;
  static const String SEND_TIMEOUT = AppStrings.sendError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.nointernetError;
}
class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}