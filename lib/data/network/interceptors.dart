import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioInterceptors {
  static List<Interceptor> getInterceptors(Talker talker) {
    return List.unmodifiable([
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestData: true,
          printResponseData: true,
        ),
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Example: Add auth token if available
          const token =
              'YOUR_AUTH_TOKEN'; // Replace with your actual token getter
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // You can globally process responses here if needed
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Log the error with Talker (no invalid cast)
          talker.handle(e);
          return handler.next(e);
        },
      ),
    ]);
  }
}
