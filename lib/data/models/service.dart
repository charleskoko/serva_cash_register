import 'package:equatable/equatable.dart';
import 'User.dart';
import 'invoice.dart';
import 'order.dart';

class Service extends Equatable {
  String id, status;
  DateTime startService, endService;
  double initialBalance, sales, benefit;
  User user;
  List<Invoice> invoices;
  List<Order> orders;

  Service(this.id, this.orders, this.status, this.startService, this.endService,
      this.initialBalance, this.invoices, this.sales, this.benefit, this.user);

  Service.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.initialBalance = json['initial_balance'].toDouble();
    this.startService = DateTime.parse(json['start_service']);
    if (json['endService'] != null) {
      this.endService = DateTime.parse(json['endService']);
    }
    this.sales =
        (json['sales'] == null) ? 0.toDouble() : json['sales'].toDouble();
    this.status = json['status'];
    this.benefit =
        (json['benefit'] == null) ? 0.toDouble() : json['benefit'].toDouble();
    this.user = User.fromJson(json['user']);
    if (json['orders'] != null) {
      List<dynamic> orders = json['orders'];
      this.orders = orders.map((element) => Order.fromJson(element)).toList();
    }
    if (json['invoices'] != null) {
      List<dynamic> invoices = json['invoices'];
      this.invoices =
          invoices.map((element) => Invoice.fromJson(element)).toList();
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'startService': startService,
        'endService': endService,
        'initialBalance': initialBalance,
        'sales': sales,
        'benefit': benefit,
        'user': user.toString(),
      };

  @override
  List<Object> get props => [
        id,
        status,
        startService,
        endService,
        initialBalance,
        sales,
        benefit,
        user,
        orders
      ];
}
