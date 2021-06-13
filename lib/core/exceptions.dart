import 'package:serva_cash_register/data/models/failure.dart';

class FileSystemExceptionError extends Failure {}

class UnauthorizedError extends Failure {}

class NoServerConnectionError extends Failure {}
