import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/models/user.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

class CurrentUserViewModel extends StateNotifier<User> {
  CurrentUserViewModel() : super(null);

  Future refresh() async {
    state = await client.getCurrentUser();
  }

  get user => state;
  set user(newUser) => state = newUser;
}

final currentUserViewModel = StateNotifierProvider((_) => CurrentUserViewModel());
