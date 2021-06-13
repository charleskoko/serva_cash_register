import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navbar_company_name.dart';
import 'navbar_edit_button.dart';
import 'navbar_search_field.dart';

class NavbarArticlesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(12.5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 1),
          right: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavbarEditButton(),
          NavbarSearchField()
        ],
      ),
    );
  }
}
