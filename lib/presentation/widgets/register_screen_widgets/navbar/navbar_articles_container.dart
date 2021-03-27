import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/jepht/development/serva_cash_register/lib/presentation/widgets/register_screen_widgets/navbar/navbar_company_name.dart';
import 'file:///C:/Users/jepht/development/serva_cash_register/lib/presentation/widgets/register_screen_widgets/navbar/navbar_edit_button.dart';
import 'file:///C:/Users/jepht/development/serva_cash_register/lib/presentation/widgets/register_screen_widgets/navbar/navbar_new_article_button.dart';

class NavbarArticlesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.6),
              right: BorderSide(color: Colors.grey, width: 0.6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavbarEditButton(),
          NavbarCompanyName(),
          NavbarNewArticleButton()
        ],
      ),
    );
  }
}
