import 'dart:async';

import 'package:blup_stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class SubscriptionResource extends Resource<Subscription> {
  SubscriptionResource(Client client) : super(client);

  Future<Subscription> retrieve(String id) async {
    final response = await get('subscriptions/$id');
    return Subscription.fromJson(response);
  }

  Future<DataList<Subscription>> list(
      [ListSubscriptionsRequest? request]) async {
    final map = await get('subscriptions', queryParameters: request?.toJson());
    return DataList<Subscription>.fromJson(
        map, (value) => Subscription.fromJson(value as Map<String, dynamic>));
  }

  Future<Subscription> cancel(String id) async {
    final response = await delete('subscriptions/$id');
    return Subscription.fromJson(response);
  }

  Future<Subscription> update({required String id, required Map<String, dynamic>? updateSubsData}) async {
    final response = await post('subscriptions/$id',data:updateSubsData );
    return Subscription.fromJson(response);
  }

}
