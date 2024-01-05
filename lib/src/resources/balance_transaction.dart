import 'dart:async';

import 'package:blup_stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class BalanceTransactionResource extends Resource<BalanceTransaction> {
  BalanceTransactionResource(Client client) : super(client);

  Future<BalanceTransaction> retrieve(String balanceTransactionId) async {
    final map = await get('balance_transactions/$balanceTransactionId');
    return BalanceTransaction.fromJson(map);
  }
}
