import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/screens/debts/components/debt_card.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';
import 'package:splitbill_client/src/models/debt.dart';
import 'package:splitbill_client/src/components/utils/loading_states/error_state.dart';
import 'package:splitbill_client/src/components/utils/loading_states/loading_data_state.dart';

final _debtsList = FutureProvider.autoDispose<List<Debt>>((ref) {
  return client.getDebts();
});

class DebtsScreenBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final debtsListProvider = useProvider(_debtsList);

    return debtsListProvider.when(
      loading: LoadingDataState.forAsyncValue,
      error: ErrorState.forAsyncValue,
      data: (debtsList) => ListView.builder(
        itemCount: debtsList.length,
        itemBuilder: (BuildContext context, int index) {
          return DebtCard(debtsList[index]);
        },
      ),
    );
  }
}
