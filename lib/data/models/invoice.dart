import 'package:equatable/equatable.dart';
import 'package:serva_cash_register/data/models/payment_method.dart';

import 'order.dart';

class Invoice extends Equatable {
  String id, status;
  int number;
  PaymentMethod paymentMethod;
  Order order;
  int total;

  Invoice(this.id, this.status, this.number, this.order, this.total,
      this.paymentMethod);

  Invoice.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.number = json['number'];
    this.status = json['status'];
    this.order = Order.fromJson(json['order']);
    this.paymentMethod = PaymentMethod.fromJson(json['paymentMethod']);
    this.total = json['total'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'status': status,
        'total': total,
        'order': order.toJson(),
        'paymentMethod': paymentMethod.toJson(),
      };

  @override
  List<Object> get props => [id, number, order, total, paymentMethod];
}
