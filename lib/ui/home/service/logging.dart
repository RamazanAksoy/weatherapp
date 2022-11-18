import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST ${options.method} => ${options.path}");
    return super.onRequest(options, handler);
  }

 @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
        print("REQUEST ${err.message} => ${err.error}");

   return super.onError(err, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
     print("REQUEST ${response.statusCode} => ${response.requestOptions.path}");

   return super.onResponse(response, handler);
  }

  
}
