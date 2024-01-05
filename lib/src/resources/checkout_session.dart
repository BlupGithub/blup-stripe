import 'dart:async';

import 'package:blup_stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CheckoutSessionResource extends Resource<CheckoutSession> {
  CheckoutSessionResource(Client client) : super(client);

  /// Creates a Stripe Checkout Session.
  Future<CheckoutSession> create(CreateCheckoutSessionRequest request) async {
    final response = await post('checkout/sessions', data: request.toJson());
    return CheckoutSession.fromJson(response);
  }

  Future<CheckoutSession> retrieve(String id) async {
    final response = await get('checkout/sessions/$id');
    return CheckoutSession.fromJson(response);
  }
}


class BillingSessionResource extends Resource{
  BillingSessionResource(Client client) : super(client);
  
  Future<Map<String,dynamic>> create(Map<String, dynamic> request) async {
    final response = await post('billing_portal/sessions', data: request);
    return response;
  }
}

class InvoiceResource extends Resource{
  InvoiceResource(Client client) : super(client);

  Future<Map<String,dynamic>> listPaidInvoice(String customerId) async {
     final response = await get('invoices',queryParameters: {"customer":customerId,"status":"paid"});
     return response;
  }
}


