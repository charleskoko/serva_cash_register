import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  String id, method;
  double value;

  PaymentMethod(this.id, this.method, this.value);

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.value = double.parse(json['value']);
    this.method = json['method'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'method': method,
      };

  @override
  List<Object> get props => [id, value, method];
}
