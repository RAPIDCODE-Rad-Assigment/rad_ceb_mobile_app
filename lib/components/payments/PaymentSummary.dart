import 'package:flutter/material.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({super.key});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  final List<Payment> payments = [
    Payment(
      paidOn: "06 May 2025",
      amount: 7400.00,
      collectionPoint: "Colombo 07",
    ),
    Payment(paidOn: "06 Apr 2025", amount: 7500.00, collectionPoint: "Kandy"),
    Payment(paidOn: "06 Mar 2025", amount: 7100.00, collectionPoint: "Galle"),
    Payment(paidOn: "06 Feb 2025", amount: 6800.00, collectionPoint: "Matara"),
    Payment(paidOn: "06 Jan 2025", amount: 7000.00, collectionPoint: "Negombo"),
    Payment(
      paidOn: "06 Dec 2024",
      amount: 6600.00,
      collectionPoint: "Anuradhapura",
    ),
    Payment(paidOn: "06 Nov 2024", amount: 6900.00, collectionPoint: "Jaffna"),
    Payment(
      paidOn: "06 Oct 2024",
      amount: 7200.00,
      collectionPoint: "Kurunegala",
    ),
    Payment(
      paidOn: "06 Sep 2024",
      amount: 6400.00,
      collectionPoint: "Ratnapura",
    ),
    Payment(paidOn: "06 Aug 2024", amount: 6700.00, collectionPoint: "Badulla"),
    Payment(
      paidOn: "06 Jul 2024",
      amount: 7000.00,
      collectionPoint: "Trincomalee",
    ),
    Payment(paidOn: "06 Jun 2024", amount: 6200.00, collectionPoint: "Ampara"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 233, 153),
      appBar: AppBar(
        backgroundColor: const Color(0xFFAE7B21),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Payment Summary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final payment = payments[index];
            return _buildPaymentCard(payment);
          },
        ),
      ),
    );
  }

  Widget _buildPaymentCard(Payment payment) {
    return Card(
      color: Color(0xFFAE7B21),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Color.fromARGB(255, 255, 236, 93), width: 2),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Paid On: ${payment.paidOn}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8DE24),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Amount: Rs. ${payment.amount.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Collection Point: ${payment.collectionPoint}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Payment {
  final String paidOn;
  final double amount;
  final String collectionPoint;

  Payment({
    required this.paidOn,
    required this.amount,
    required this.collectionPoint,
  });
}
