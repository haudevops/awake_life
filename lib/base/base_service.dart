// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
//
// class BaseService {
//   factory BaseService() {
//     return _instance;
//   }
//
//   BaseService._internal() {
//     final options = BaseOptions(
//       baseUrl: baseUrl,
//       connectTimeout: 30000,
//       receiveTimeout: 30000,
//       headers: {},
//       contentType: 'application/json',
//       responseType: ResponseType.json,
//     );
//
//     dio = Dio(options);
//
//     dio.interceptors
//         .add(InterceptorsWrapper(onRequest: (options, handler) async {
//       // final token = AccountUtil.instance.getToken();
//       final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MmZkZTQxMmFhZWZlNzYwOGY1OGFiYTciLCJkYXRhIjp7InVzZXItYWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuNTExMi44MSBTYWZhcmkvNTM3LjM2IEVkZy8xMDQuMC4xMjkzLjU0IiwidXVpZCI6bnVsbH0sImlhdCI6MTY2MDgwNzAwOX0.IgP8iPGDlV8uCA0dCk04ZGVOD-skGMYdMtE2qTOd09Q';
//       if (token != null) {
//         options.headers['content-type'] = 'application/json';
//         options.headers['Authorization'] = 'Bearer $token';
//       }
//       return handler.next(options);
//     }));
//
//     dio.interceptors.add(LoggerInterceptor());
//   }
//
//   static final BaseService _instance = BaseService._internal();
//   late Dio dio;
//
//   Future get<T>(String path,
//       {Map<String, dynamic>? params, Options? options}) async {
//     try {
//       final response =
//           await dio.get(path, queryParameters: params, options: options);
//       return handleResponse<T>(response);
//     } on DioError catch (e) {
//       return BaseResponse(
//           errorCode: createErrorEntity(e).code,
//           message: createErrorEntity(e).message);
//     }
//   }
//
//   Future post<T>(String path, {dynamic params, Options? options}) async {
//     try {
//       final response = await dio.post(path, data: params, options: options);
//       return handleResponse<T>(response);
//     } on DioError catch (e) {
//       return BaseResponse(
//           errorCode: createErrorEntity(e).code,
//           message: createErrorEntity(e).message);
//     }
//   }
//
//   Future put<T>(String path, {Map<String, dynamic>? params}) async {
//     try {
//       final response = await dio.put(path, data: params);
//       return handleResponse<T>(response);
//     } on DioError catch (e) {
//       return BaseResponse(
//           errorCode: createErrorEntity(e).code,
//           message: createErrorEntity(e).message);
//     }
//   }
//
//   BaseResponse<T> handleResponse<T>(Response response) {
//     const _errorCodeKey = 'errorCode';
//     const _messageKey = 'message';
//     const _dataKey = 'data';
//
//     late int _errorCode;
//     late String _message;
//     T? _data;
//
//     if (response.statusCode == HttpStatus.ok ||
//         response.statusCode == HttpStatus.created) {
//       try {
//         if (response.data is Map) {
//           _errorCode = response.data[_errorCodeKey];
//           _message = response.data[_messageKey];
//           _data = _errorCode != Constants.ERROR_CODE
//               ? response.data[_dataKey]
//               : null;
//         } else {
//           final _dataMap = _decodeData(response);
//           _errorCode = response.data[_errorCodeKey];
//           _message = response.data[_messageKey];
//           _data =
//               _errorCode != Constants.ERROR_CODE ? _dataMap[_dataKey] : null;
//         }
//       } catch (e) {
//         DebugLog.show(e.toString());
//         _errorCode = -1;
//         _message = S.current.an_unknown_error;
//       }
//     }
//     return BaseResponse(errorCode: _errorCode, message: _message, data: _data);
//   }
//
//   Map<String, dynamic> _decodeData(Response? response) {
//     if (response == null ||
//         response.data == null ||
//         response.data.toString().isEmpty) {
//       return {};
//     }
//     return json.decode(response.data.toString());
//   }
// }
//
// ErrorEntity createErrorEntity(DioError error) {
//   switch (error.type) {
//     case DioErrorType.cancel:
//       return ErrorEntity(code: -1, message: S.current.request_cancel);
//     case DioErrorType.connectTimeout:
//       return ErrorEntity(code: -1, message: S.current.connect_timeout);
//     case DioErrorType.sendTimeout:
//       return ErrorEntity(code: -1, message: S.current.request_timed_out);
//     case DioErrorType.receiveTimeout:
//       return ErrorEntity(code: -1, message: S.current.receive_timed_out);
//     case DioErrorType.response:
//       try {
//         final errCode = error.response?.statusCode;
//         switch (errCode) {
//           case 400:
//             return ErrorEntity(
//                 code: -1, message: S.current.syntax_error_request);
//           case 401:
//             return ErrorEntity(code: -1, message: S.current.access_denied);
//           case 403:
//             return ErrorEntity(
//                 code: -1, message: S.current.the_server_refused_to_execute);
//           case 404:
//             return ErrorEntity(
//                 code: -1, message: S.current.can_not_connect_to_server);
//           case 405:
//             return ErrorEntity(code: -1, message: S.current.method_not_allowed);
//           case 500:
//             return ErrorEntity(
//                 code: -1, message: S.current.server_internal_error);
//           case 502:
//             return ErrorEntity(code: -1, message: S.current.invalid_request);
//           case 503:
//             return ErrorEntity(
//                 code: -1, message: S.current.the_server_has_crashed);
//           case 505:
//             return ErrorEntity(
//                 code: errCode!,
//                 message: S.current.does_not_support_HTTP_protocol_requests);
//           default:
//             return ErrorEntity(
//                 code: -1,
//                 message: error.response?.statusMessage ??
//                     S.current.an_unknown_error);
//         }
//       } on Exception catch (_) {
//         return ErrorEntity(code: -1, message: S.current.an_unknown_error);
//       }
//     default:
//       if (error.message.contains('SocketException')) {
//         return ErrorEntity(code: -1, message: S.current.no_network_connection);
//       }
//       return ErrorEntity(code: -1, message: error.message);
//   }
// }
//
// class ErrorEntity implements Exception {
//   ErrorEntity({required this.code, required this.message});
//
//   int code;
//   String message;
// }
