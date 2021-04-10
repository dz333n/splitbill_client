import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/components/utils/loading_states/error_state.dart';
import 'package:splitbill_client/src/components/utils/loading_states/loading_data_state.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/chosen_products_list.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

final _chosenProducts = FutureProvider.autoDispose.family<List<ChosenProduct>, int>((ref, billId) {
  ref.maintainState = true;

  return client.getChosenProducts(billId);
});

class BillDetailsScreenBody extends HookWidget {
  final int billId;

  BillDetailsScreenBody(this.billId);

  @override
  Widget build(BuildContext context) {
    final chosenProductsState = useProvider(_chosenProducts(billId));

    return chosenProductsState.when(
      error: ErrorState.forAsyncValue,
      loading: LoadingDataState.forAsyncValue,
      data: (chosenProducts) {
        return ChosenProductsList(chosenProducts);
      }
    );
  }
}
