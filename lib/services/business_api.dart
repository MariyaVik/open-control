import 'package:dio/dio.dart';

import '../entities/all_consultations.dart';
import '../entities/consultation.dart';
import '../entities/info.dart';
import 'api_ulrs.dart';

class BusinessAPI {
  BusinessAPI._();
  static final instance = BusinessAPI._();

  final _dio = Dio();

  Future<String> authApiRequest(String email, String password) async {
    String url = ApiUrls.baseUrl + ApiUrls.loginUrl;
    Map<String, String> headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    Options options = Options(headers: headers);

    Map<String, String> body = {'login': email, 'password': password};

    var response = await _dio.post(url, options: options, data: body);

    print(response.statusCode);
    print(response.data.toString());
    return response.data['access_token'];
  }

  Future<Map<String, dynamic>> getSlots(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.slotUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'aapplication/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var response = await _dio.get(url, options: options);
    return response.data;
  }

  Future<Info> getKnoInfo(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.typelistUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'aapplication/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var response = await _dio.get(url, options: options);
    return Info.fromJson(response.data);
  }

  Future<AllConsultations> getConsultations(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'aapplication/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var response = await _dio.get(url, options: options);
    List<Consultation> active = response.data['active']
            ?.map<Consultation>((e) => Consultation.fromJson(e))
            .toList() ??
        [];
    List<Consultation> finished = response.data['finished']
            ?.map<Consultation>((e) => Consultation.fromJson(e))
            .toList() ??
        [];
    return AllConsultations(activeKons: active, finishedKons: finished);
  }

  Future<void> postConsultation(String token, Consultation consultation) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var cons = consultation.toJson();
    print(cons);
    try {
      await _dio.post(url, options: options, data: cons);
      print('ЗАПИСАНЫ');
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<void> deleteConsultation(String token, int consId) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);

    Map<String, int> queryParameters = {'id': consId};

    try {
      await _dio.delete(url,
          options: options, queryParameters: queryParameters);
      print('УДАЛЕНО');
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<void> editConsultationStatus(
      String token, int consId, bool isApply) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);

    Map<String, dynamic> body = {'id': consId, 'apply': isApply};

    try {
      await _dio.patch(url, options: options, data: body);
      print('ИЗМЕНЕНО');
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}







// 'http://hack.torbeno.ru/api/v1/login',
//                           options: Options(
//                               contentType: 'application/x-www-form-urlencoded'),
//                           data: {'login': 'user', 'password': '123321'});