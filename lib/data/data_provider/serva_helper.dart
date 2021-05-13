import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:sqflite/sqflite.dart';

final String tableArticles = 'articles';
final String articleColumnId = 'id';
final String articleColumnLabel = 'label';
final String articleColumnNumber = 'number';
final String articleColumnPrice = 'price';
final String articleColumnDescription = 'description';
final String articleColumnCategoryId = 'categoryId';

final String tableOrderItems = 'orderItems';
final String orderItemColumnId = 'id';
final String orderItemColumnArticleId = 'articleId';
final String orderItemColumnArticle = 'article';
final String orderItemColumnPrice = 'price';
final String orderItemColumnQuantity = 'quantity';
final String orderItemColumnName = 'name';

class ServaHelper {
  static Database _database;
  static ServaHelper _servaHelper;

  ServaHelper._createInstance();
  factory ServaHelper() {
    if (_servaHelper == null) {
      _servaHelper = ServaHelper._createInstance();
    }
    return _servaHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  void insertArticle(Article article) async {
    var db = await this.database;
    final int result = await db.insert(tableArticles, article.toJson());
    print('save in sql table article result: $result');
  }

  void insertOrderItem(OrderItem orderItem) async {
    var db = await this.database;
    final int result = await db.insert(tableOrderItems, orderItem.toJson());
    print('save in sql table order item result: $result');
  }

  Future<int> deleteOrderITem(String name) async {
    var db = await this.database;
    return await db.delete(tableOrderItems,
        where: '$orderItemColumnName = ?', whereArgs: [name]);
  }

  Future<List<OrderItem>> getOrderItem({String name}) async {
    var db = await this.database;
    List<OrderItem> orderItems = [];
    if (name == null) {
      var result = await db.query(tableOrderItems);
      result.forEach((element) {
        var orderItem = OrderItem.fromJson(element);
        orderItems.add(orderItem);
      });
    } else {
      var result = await db.query(tableOrderItems,
          where: '$orderItemColumnName = ?', whereArgs: [name]);
      result.forEach((element) {
        var orderItem = OrderItem.fromJson(element);
        orderItems.add(orderItem);
      });
    }

    return orderItems;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "serva.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      create table $tableArticles (
      $articleColumnId text primary key, 
      $articleColumnLabel text, 
      $articleColumnNumber text, 
      $articleColumnPrice float, 
      $articleColumnDescription text null, 
      $articleColumnCategoryId text null)
      ''');
        db.execute('''
         create table $tableOrderItems (
      $orderItemColumnId integer primary key autoincrement, 
      $orderItemColumnArticleId text, 
      $orderItemColumnArticle text, 
      $orderItemColumnPrice float, 
      $orderItemColumnQuantity int, 
      $orderItemColumnName text not null
      )
      ''');
      },
    );
    return database;
  }
}
