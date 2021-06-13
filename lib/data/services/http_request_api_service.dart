import 'dart:io';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRequestApiService extends HttpRequestService {
  String token;

  _getToken() async {
    AuthRepository _authRepository = AuthRepository();
    token = await _authRepository.getUserToken();
    if (token != null) {
      token = token.substring(1, token.length - 1);
    }
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      await _getToken();
      final result = await http.get(uri, headers: _setHeaders());
      if (result.statusCode == 401) {
        throw UnauthorizedError();
      } else {
        Map<String, dynamic> body = json.decode(result.body);

        return body;
      }
    } on SocketException {
      throw NoServerConnectionError();
    }
  }

  @override
  Future<Map<String, dynamic>> patch(String url,
      {Map<String, dynamic> data}) async {
    try {
      var uri = Uri.parse(url);
      await _getToken();
      final result = await http.patch(uri,
          body: json.encode(data), headers: _setHeaders());
      if (result.statusCode == 401) {
        throw UnauthorizedError();
      } else {
        Map<String, dynamic> body = json.decode(result.body);

        return body;
      }
    } on SocketException {
      throw NoServerConnectionError();
    }
  }

  @override
  Future<Map<String, dynamic>> post(String url,
      {Map<String, dynamic> data}) async {
    try {
      var uri = Uri.parse(url);
      await _getToken();
      final result =
          await http.post(uri, body: json.encode(data), headers: _setHeaders());
      if (result.statusCode == 401) {
        throw UnauthorizedError();
      } else {
        Map<String, dynamic> body = json.decode(result.body);
        return body;
      }
    } on SocketException {
      throw NoServerConnectionError();
    }
  }

  @override
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic> data}) async {
    try {
      var uri = Uri.parse(url);
      await _getToken();
      final result = await http.delete(uri, headers: _setHeaders());
      if (result.statusCode == 401) {
        throw UnauthorizedError();
      } else {
        Map<String, dynamic> body = json.decode(result.body);

        return body;
      }
    } on SocketException {
      throw NoServerConnectionError();
    }
  }

  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };
}
