import 'dart:convert';

import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/models/service.dart';
import 'package:serva_cash_register/data/services/user_service_service.dart';

class UserServiceRepository {
  UserServiceService _service = UserServiceService();

  Future<Service> saveInitialBalance(data) async {
    try {
      final Service initialBalance = await _service.saveInitialBalance(data);
      return initialBalance;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }

  Future<Service> getServiceInfo(String savedServiceId) async {
    try {
      final Service service = await _service.view(savedServiceId);
      return service;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }

  Future<bool> endService(String id, Map<String, String> data) async {
    try {
      final bool isUpdated = await _service.update(id, data:data);
      return isUpdated;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }
}
