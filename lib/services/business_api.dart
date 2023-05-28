import 'package:dio/dio.dart';
import 'package:open_control/entities/hint_button.dart';
import 'package:open_control/entities/user_info.dart';

import '../entities/all_consultations.dart';
import '../entities/consultation.dart';
import '../entities/faq.dart';
import '../entities/info.dart';
import '../entities/message.dart';
import '../entities/notifications.dart';
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

  Future<void> editConsultationStatus(String token, int consId, bool isApply,
      [String answer = '']) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);

    Map<String, dynamic> body = {
      'id': consId,
      'apply': isApply,
      'answer': answer
    };

    try {
      await _dio.patch(url, options: options, data: body);
      print('ИЗМЕНЕНО');
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<UserInfo> getUserInfo(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.userUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var response = await _dio.get(url, options: options);
    return UserInfo.fromJson(response.data);
  }

  Future<List<Message>> getMessages(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.chatUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    List<Message> result = [];
    try {
      Response<Map<String, dynamic>> response =
          await _dio.get(url, options: options);

      for (final value in response.data!.values) {
        for (var mes in value) {
          Message message = Message.fromJson(mes);
          result.add(message);
        }
      }

      return result;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Message>> postMessage(String token, String text) async {
    String url = ApiUrls.baseUrl + ApiUrls.chatUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var body = {'text': text};
    try {
      List<Message> result = [];
      var response = await _dio.post(url, options: options, data: body);
      for (final value in response.data!) {
        Message mes = Message.fromJson(value);
        result.add(mes);
      }

      return result;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<HintButton>> getButtons(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.buttonUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    List<HintButton> result = [];
    try {
      Response<List<dynamic>> response = await _dio.get(url, options: options);
      print(response.data);

      for (final value in response.data!) {
        HintButton button = HintButton.fromJson(value);
        result.add(button);
      }

      return result;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Notifications>> getNotifications(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.notificationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    List<Notifications> result = [];
    try {
      Response<Map<String, dynamic>> response =
          await _dio.get(url, options: options);

      for (final value in response.data!.values) {
        for (var notif in value) {
          Notifications notification = Notifications.fromJson(notif);
          result.add(notification);
        }
      }

      return result;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<void> putAnswerCancelConsultation(
      String token, int consId, String text) async {
    String url = ApiUrls.baseUrl + ApiUrls.consultationUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    var body = {'id': consId, 'answer': text};
    try {
      await _dio.put(url, options: options, data: body);
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Faq>> getFaq(String token) async {
    String url = ApiUrls.baseUrl + ApiUrls.faqUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    Options options = Options(headers: headers);
    List<Faq> result = [];
    try {
      Response<List<dynamic>> response = await _dio.get(url, options: options);
      print(response.data);

      for (final value in response.data!) {
        Faq faqs = Faq.fromJson(value);
        result.add(faqs);
      }

      return result;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<void> postTokenDevice(String tokenUser, String tokenDevice) async {
    String url = ApiUrls.baseUrl + ApiUrls.userUrl;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $tokenUser',
    };
    Options options = Options(headers: headers);
    var body = {'token': tokenDevice};
    try {
      var r = await _dio.post(url, options: options, data: body);
      print(r.data);
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}
