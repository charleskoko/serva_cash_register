import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/core/abstract/const.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/invoice.dart';
import 'package:serva_cash_register/data/models/order.dart';
import 'package:serva_cash_register/logic/article_cubit.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/logic/summary_cubit.dart';
import 'package:serva_cash_register/logic/text_field_error_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/main.dart';
import 'package:serva_cash_register/presentation/widgets/confirm_close_service.dart';
import 'package:serva_cash_register/presentation/widgets/no_service_started.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/cash_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/gross_total_card.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/other_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/payments_tabs_card.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_widgets/cash_register_navbar/navbar_search_field.dart';
import 'package:serva_cash_register/presentation/widgets/summary/balance_container.dart';
import 'package:serva_cash_register/presentation/widgets/summary/card_widget.dart';
import 'package:serva_cash_register/presentation/widgets/summary/list_card_payment_method.dart';
import 'package:serva_cash_register/presentation/widgets/summary/summary_navbar.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SummaryCubit, SummaryState>(
        listener: (context, state) {
          if (state is SummaryClosed) {
            BlocProvider.of<InitialBalanceCubit>(context).noInitialBalance();
            Navigator.pop(context);
          }
          if (state is SummaryError) {
            if (state.isServiceCloseError == true) {
              showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) {
                    final curvedValue =
                        Curves.easeInOutBack.transform(a1.value) - 1.0;
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, curvedValue * 200, 0.0),
                      child: Opacity(
                        opacity: a1.value,
                        child: ConfirmCloseService(
                            'Vous etes sur le point de cloturer votre '
                            'service. Etes-vous sure de vouloir '
                            'effectuer cette action? Si oui, '
                            'veuillez entrer votre mot de passe '
                            'puis confirmer.', isPasswordFalse: true,),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              child: (state is SummaryLoaded)
                  ? Column(
                      children: [
                        // navbar
                        SummaryNavbar(),
                        // content
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                BalanceContainer(state.service.sales,
                                    state.service.initialBalance),
                                SizedBox(height: 20),
                                ListCardPaymentMethod(
                                    state.service.invoices, state.service.sales)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: (state.service.invoices != [])
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListView.builder(
                                    itemCount: state.service.invoices.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      List<Invoice> invoices =
                                          state.service.invoices;
                                      return Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        '${invoices[index].order.user.firstName}'
                                                        ' ${invoices[index].order.user.lastName}')),
                                                Expanded(
                                                  child: Text(invoices[index]
                                                      .number
                                                      .toString()),
                                                ),
                                                Expanded(
                                                  child: Text(invoices[index]
                                                      .order
                                                      .number),
                                                ),
                                                Expanded(
                                                  child: Text(invoices[index]
                                                      .total
                                                      .toString()),
                                                ),
                                                Expanded(
                                                  child: Text(invoices[index]
                                                      .paymentMethod
                                                      .method),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      invoices[index].status),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            color: Colors.white,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    )
                  : (State is SummaryError)
                      ? Container(
                          child: Center(
                            child: Text('error'),
                          ),
                        )
                      : Container(
                          child: Center(
                            child: SpinKitCircle(
                              color: Colors.black,
                            ),
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
