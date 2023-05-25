// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// enum AuthApiStatus {
//   authenticated,
//   unauthorized,
//   tokenTimeOut,
//   internetConnectionError,
//   commonError
// }

// enum ResponseStatusType { error, authTokenExpired, success }

// @singleton
// class ApiClient {
//   late Dio dioAuthClient;
//   late Dio dioClient;
//   late Map<String, String> headers;
//   late BaseOptions options;
//   late String accessToken;
//   String baseUrl = AppConstants().getBaseUrl();

//   Future<AuthHTTPResponse?> authApiRequest(
//       String email, String password, String inn, bool isDebugIosMode) async {
//     if (isDebugIosMode) {
//       baseUrl = AppConstants().getIosTestUserUrl();
//     }
//     headers = {
//       'Accept': 'application/json',
//       'content-type': 'application/x-www-form-urlencoded',
//     };

//     Map<String, String> body = {
//       'email': email,
//       'password': password,
//       'inn': inn
//     };

//     options = BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: 10000,
//         receiveTimeout: 10000,
//         receiveDataWhenStatusError: true,
//         headers: headers);

//     dioAuthClient = Dio(options);
//     dioAuthClient.interceptors.addAll({
//       LogInterceptor(
//         responseHeader: true,
//         responseBody: true,
//         error: true,
//       ),
//       AppExceptionInterceptor()
//     });

//     try {
//       var response = await dioAuthClient.post('/v1/login', data: body);
//       if (response.statusCode == 200) {
//         debugPrint('success');
//         return AuthHTTPResponse(AuthApiStatus.authenticated,
//             AuthResponseModel.fromJson(response.data));
//       }
//     } on UnauthorizedException {
//       debugPrint('Неверный email');
//       return AuthHTTPResponse(
//           AuthApiStatus.unauthorized, null, 'Неверный email или пароль');
//     } catch (error) {
//       debugPrint(error.toString());
//       return AuthHTTPResponse(
//           AuthApiStatus.commonError, null, error.toString());
//     }
//     return null;
//   }

//   Future<AuthHTTPResponse?> refreshTokenRequest(String refreshToken) async {
//     headers = {
//       'Accept': 'application/json',
//       'content-type': 'application/x-www-form-urlencoded',
//     };

//     Map<String, String> body = {
//       'refresh_token': refreshToken,
//     };

//     options = BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: 1000,
//         receiveTimeout: 1000,
//         receiveDataWhenStatusError: true,
//         headers: headers);

//     dioAuthClient = Dio(options)
//       ..interceptors.addAll([
//         LogInterceptor(
//           responseHeader: true,
//           responseBody: true,
//           error: true,
//         ),
//         AppExceptionInterceptor()
//       ]);

//     try {
//       var response = await dioAuthClient.post('/v1/token', data: body);
//       if (response.statusCode == 200) {
//         debugPrint('success');
//         return AuthHTTPResponse(AuthApiStatus.authenticated,
//             AuthResponseModel.fromJson(response.data));
//       }
//     } on UnauthorizedException {
//       debugPrint('Неверный email');
//       return AuthHTTPResponse(
//           AuthApiStatus.unauthorized, null, 'Неверный email или пароль');
//     } catch (error) {
//       debugPrint(error.toString());
//       return AuthHTTPResponse(
//           AuthApiStatus.commonError, null, error.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> fetchSchedule(String token) async {
//     headers = {
//       'Accept': 'application/json',
//       'content-type': 'application/json; charset=utf-8',
//       'Authorization': 'Bearer $token',
//     };

//     options = BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: 5000,
//         receiveTimeout: 5000,
//         receiveDataWhenStatusError: true,
//         headers: headers);

//     dioClient = Dio(options)
//       ..interceptors.addAll([
//         LogInterceptor(
//           responseHeader: true,
//           responseBody: true,
//           error: true,
//         ),
//         AppExceptionInterceptor()
//       ]);
//     try {
//       var response = await dioClient.get('/v1/scheduler');
//       if (response.statusCode == 200) {
//         debugPrint('scheduler api fetched:' + response.data.toString());
//         return HTTPResponse(
//             ResponseStatusType.success, ScheduleModel.fromJson(response.data));
//       } else if (response.statusCode == 204) {
//         return HTTPResponse(ResponseStatusType.error, '',
//             message: '204: Нет расписания расписания для этого пользователя');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } on ConflictException {
//       return HTTPResponse(ResponseStatusType.error, '',
//           message: '409: Нельзя редактировать этот оффер');
//     } catch (e) {
//       debugPrint(e.toString());
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> acceptSchedule(int offerId, String token) async {
//     try {
//       var response = await dioClient.post('/v1/scheduler',
//           data: OfferId(offerId: offerId).toJson());
//       if (response.statusCode == 200) {
//         debugPrint('schedule offer accepted' + response.data.toString());
//         return HTTPResponse(ResponseStatusType.success, '');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } on ConflictException {
//       return HTTPResponse(ResponseStatusType.error, '',
//           message: '409: Нельзя принять этот оффер');
//     } catch (e) {
//       debugPrint(e.toString());
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> editSchedule(int offerId, String token) async {
//     try {
//       var response = await dioClient.put(
//         '/v1/scheduler?offerId=$offerId',
//       );
//       if (response.statusCode == 200) {
//         debugPrint('schedule offer accepted' + response.data.toString());
//         return HTTPResponse(ResponseStatusType.success, '');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } on ConflictException {
//       return HTTPResponse(ResponseStatusType.error, '',
//           message: '409: Нельзя редактировать этот оффер');
//     } catch (e) {
//       debugPrint(e.toString());
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> deleteSchedule(int offerId, String token) async {
//     try {
//       var response = await dioClient.delete(
//         '/v1/scheduler?offerId=$offerId',
//       );
//       if (response.statusCode == 200) {
//         debugPrint('schedule offer accepted' + response.data.toString());
//         return HTTPResponse(ResponseStatusType.success, '');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } on ConflictException {
//       return HTTPResponse(ResponseStatusType.error, '',
//           message: '409: Нельзя удалить этот оффер');
//     } catch (e) {
//       debugPrint(e.toString());
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> getUserDetails() async {
//     try {
//       var response = await dioClient.get('/v1/account');
//       if (response.statusCode == 200) {
//         debugPrint('return fetched account');
//         return HTTPResponse(ResponseStatusType.success,
//             AccountDetailsResponse.fromJson(response.data));
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } catch (e) {
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> getAlfaStatus() async {
//     try {
//       var response = await dioClient.get('/v1/checkAlfaAgree');
//       if (response.statusCode == 200) {
//         debugPrint('return fetched link' + response.toString());
//         return HTTPResponse(ResponseStatusType.success,
//             CheckAlfaAgreeResponse.fromJson(response.data));
//       }
//     } on UnauthorizedException {
//       debugPrint('return exception');
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } catch (e) {
//       debugPrint('return exception');
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<void> initCommonDioClient(String token) async {
//     accessToken = token;
//     headers = {
//       'Accept': 'application/json',
//       'content-type': 'application/json; charset=utf-8',
//       'Authorization': 'Bearer $token',
//     };

//     options = BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: 5000,
//         receiveTimeout: 5000,
//         receiveDataWhenStatusError: true,
//         headers: headers);

//     dioClient = Dio(options)
//       ..interceptors.addAll([
//         LogInterceptor(
//           responseHeader: true,
//           responseBody: true,
//           error: true,
//         ),
//         AppExceptionInterceptor()
//       ]);
//   }

//   Future<HTTPResponse?> getDriverState() async {
//     debugPrint('request driver state');

//     try {
//       var response = await dioClient.get('/v1/driverState');
//       if (response.statusCode == 200) {
//         debugPrint('return fetched driver state + ' + response.data.toString());

//         return HTTPResponse(ResponseStatusType.success,
//             DriverStateModel.fromJson(response.data));
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } catch (e) {
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   ///for ios testing mode change baseUrl
//   setTestIosUserModeApi() async {
//     baseUrl = AppConstants().getIosTestUserUrl();
//     //String? token = await _cache.readToken();
//     //initCommonDioClient(token!);
//   }

//   Future<HTTPResponse?> updateContractDriverState(
//       String email, String date) async {
//     try {
//       String appVersion = await getAppVersion();
//       var response = await dioClient.put('/v1/driverState',
//           data: UpdateContractModel(
//                   isEmailFinished: true,
//                   isContractAcceptFinished: true,
//                   reportEmail: email,
//                   dateContractAcceptFinished: date,
//                   userAppVer: appVersion)
//               .toJson());
//       if (response.statusCode == 200) {
//         debugPrint('success updated driver state');
//         return HTTPResponse(ResponseStatusType.success, '');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } catch (e) {
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }

//   Future<HTTPResponse?> updateAlfaDriverState() async {
//     try {
//       String appVersion = await getAppVersion();

//       var response = await dioClient.put('/v1/driverState',
//           data: UpdateAlfaRegModel(
//                   isAlfaOnbordingFinished: true, userAppVer: appVersion)
//               .toJson());
//       if (response.statusCode == 200) {
//         debugPrint('success updated driver state');
//         return HTTPResponse(ResponseStatusType.success, '');
//       }
//     } on UnauthorizedException {
//       return HTTPResponse(ResponseStatusType.authTokenExpired, '');
//     } catch (e) {
//       return HTTPResponse(ResponseStatusType.error, '', message: e.toString());
//     }
//     return null;
//   }
// }

// class AuthHTTPResponse<T> {
//   AuthApiStatus authStatus;
//   AuthResponseModel? token;
//   String? message;

//   AuthHTTPResponse(this.authStatus, [this.token, this.message]);
// }

// class HTTPResponse<T> {
//   ResponseStatusType responseType;
//   T data;
//   String? message;

//   HTTPResponse(this.responseType, this.data, {this.message});
// }
