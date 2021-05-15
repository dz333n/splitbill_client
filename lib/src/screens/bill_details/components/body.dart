import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/components/utils/loading_states/error_state.dart';
import 'package:splitbill_client/src/components/utils/loading_states/loading_data_state.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/chosen_products_list.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

final _chosenProducts =
    FutureProvider.autoDispose.family<List<ChosenProduct>, int>((ref, billId) {
  ref.maintainState = true;

  return client.getChosenProducts(billId);
});

class BillDetailsScreenBody extends HookWidget {
  final int billId;

  BillDetailsScreenBody(this.billId);

  @override
  Widget build(BuildContext context) {
    final chosenProductsStateProvider = useProvider(_chosenProducts(billId));

    return chosenProductsStateProvider.when(
      error: ErrorState.forAsyncValue,
      loading: LoadingDataState.forAsyncValue,
      data: (chosenProducts) {
        return _ChosenProductsList(
          billId: billId,
          chosenProducts: chosenProducts,
        );
      },
    );
  }
}

class _ChosenProductsList extends HookWidget {
  final List<ChosenProduct> chosenProducts;
  final int billId;

  _ChosenProductsList({
    @required this.billId,
    @required this.chosenProducts,
  });

  @override
  Widget build(BuildContext context) {
    final chosenProductsState = useState(chosenProducts);

    onCoefficientChange(
      ChosenProduct chosenProduct,
      double coefficient,
    ) async {
      try {
        final updatedChosenProduct = ChosenProduct(
          coefficient: coefficient,
          product: chosenProduct.product,
        );

        await client.updateChosenProduct(billId, updatedChosenProduct);

        // We need to create a new array with the new product
        // so that we do not modify the old one
        final products = chosenProductsState.value.map((e) {
          if (e != chosenProduct) {
            return e;
          }

          return updatedChosenProduct;
        }).toList();

        chosenProductsState.value = products;
      } on Exception catch (error) {
        print("Got an error, ${error.toString()}");
      }
    }

    return ChosenProductsList(
      chosenProducts: chosenProductsState.value,
      onCoefficientChange: onCoefficientChange,
    );
  }
}
