import 'package:flutter/material.dart';

import '../../../core/failure.dart';
import '../../../core/localization/localizations.dart';
import '../../../domain/entities/tranzaction_model.dart';
import '../../../domain/repositories/is_service_repository.dart';
import '../../../injectable.dart';
import '../../widgets/circular_progress_indicator_widget.dart';
import '../../widgets/nointernet_widget.dart';
import '../transaction_page_widgets/transaction_list_widget.dart';

class TransactionPageList extends StatelessWidget {
  const TransactionPageList({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<Transaction>>(
        future: getIt<IsService>().getTransactionList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TranzactionListWidget(
              size: size,
              transactionList: snapshot.data,
            );
          }
          if (snapshot.hasError) {
            if (snapshot.error is EmptyList) {
              return Center(
                child: Container(
                  width: size.width,
                  height: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.width * .15,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * .6,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              'assets/icons/no_transaction.png',
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: size.width * .65,
                        child: Container(
                          width: size.width,
                          child: Text(AppLocalizations.of(context).translate('notransactions'),
                              style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const NoInternetWidget();
            }
          }
          return CircularProgresIndicatorWidget();
        },
      ),
    );
  }
}
