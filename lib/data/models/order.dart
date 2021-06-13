import 'package:equatable/equatable.dart';
import 'package:serva_cash_register/data/models/payment_method.dart';

import 'User.dart';
import 'order_item.dart';

class Order extends Equatable {
  String id, number;
  User user;
  List<OrderItem> orderItems;
  PaymentMethod paymentMethod;

  Order(this.id, this.number, this.paymentMethod, this.user, this.orderItems);

  Order.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.number = json['number'];
    this.user = User.fromJson(json['user']);
    this.paymentMethod = PaymentMethod.fromJson(json['paymentMethode']);
    if (json['orderItems'] != null) {
      List<dynamic> orderItems = json['orderItems'];
      this.orderItems =
          orderItems.map((element) => OrderItem.fromJson(element)).toList();
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
      };

  @override
  List<Object> get props => [id, number];
}
