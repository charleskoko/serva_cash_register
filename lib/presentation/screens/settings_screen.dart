import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/settings_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/setting_Screen_title.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/article_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/configuration_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/customer_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/peripheriques_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/profile_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_button/team_button.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/article_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/configuration_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/customer_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/intial_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/loading_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/peripherique_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/profile_screen.dart';
import 'package:serva_cash_register/presentation/widgets/setting_widgets/settings_menu_screen/team_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<SettingsCubit>(context),
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SettingScreenTitle(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5,top: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              children: [
                                ProfileButton(),
                                TeamButton(),
                                ArticleButton(),
                                PeripheriqueButton(),
                                CustomerButton(),
                                ConfigurationButton(),
                              ],
                            ),
                          ),
                          (state is SettingsProfile)
                              ? ProfileScreen(state)
                              : (state is SettingsTeam)
                                  ? TeamScreen()
                                  : (state is SettingsArticles)
                                      ? ArticleScreen()
                                      : (state is SettingsPeripherique)
                                          ? PeripheriqueScreen()
                                          : (state is SettingsCustomer)
                                              ? CustomerScreen()
                                              : (state is SettingsConfiguration)
                                                  ? ConfigurationScreen()
                                                  : (state is SettingsLoading)
                                                      ? LoadingScreen()
                                                      : (state
                                                              is SettingsInitial)
                                                          ? InitialScreen()
                                                          : Container(
                                                              child: Center(
                                                                child: Text(
                                                                    'Error'),
                                                              ),
                                                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
