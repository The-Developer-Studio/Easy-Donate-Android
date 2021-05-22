import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class DeveloperDonation extends StatefulWidget {
  @override
  _DeveloperDonationState createState() => _DeveloperDonationState();
}

class _DeveloperDonationState extends State<DeveloperDonation> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help the Developers',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore '
                'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Lorem ipsum d'
                'olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut '
                'enim ad minim veniam, quis nostrud exercitation ullamco. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
                ' incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                style: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              GooglePayButton(
                // height: 30,
                width: 800,
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(child: Branding()),
            ],
          ),
        ),
      ),
    );
  }
}
