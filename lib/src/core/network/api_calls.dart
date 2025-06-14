import 'package:bloc_demo/main_export.dart';

class MyApiCalls {
  static final _dio = Dio();
  static Future<Either<Failure, dynamic>> callGetReq() async {
    try {
      // Check connectivity first
      // final connectivityResult = await Connectivity().checkConnectivity();
      // if (connectivityResult == ConnectivityResult.none) {
      //   return Left(NetworkFailure("No internet connection"));
      // }
      debugPrint("calling api");
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/todos',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(response.data);
      } else {
        return Left(ServerFailure("Request failed with status: ${response.statusCode}"));
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        final statusCode = ex.response?.statusCode ?? -1;
        final message = ex.response?.statusMessage ?? "Request failed";
        debugPrint("API Error - Status: $statusCode, Message: $message");
        switch (statusCode) {
          case 400:
            return Left(BadRequestFailure(message));
          case 401:
            return Left(UnauthorizedFailure(message));
          case 403:
            return Left(
              ForbiddenFailure(
                message: message,
                requiredRole: "user",
                currentRole: "user",
              ),
            );
          case 404:
            return Left(NotFoundFailure(message));
          case 500:
            return Left(ServerFailure(message));
          default:
            return Left(ServerFailure("HTTP error $statusCode: $message"));
        }
      } else {
        return Left(NetworkFailure(ex.message ?? "Network error occurred"));
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return Left(ServerFailure("Unexpected error occurred"));
    }
  }
}
