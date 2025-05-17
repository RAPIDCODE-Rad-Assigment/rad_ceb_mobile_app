import 'package:flutter/material.dart';

class BillSummary extends StatefulWidget {
  const BillSummary({super.key});

  @override
  State<BillSummary> createState() => _BillSummaryState();
}

class _BillSummaryState extends State<BillSummary> {
  final List<Bill> bills = [
    Bill(
      month: "May 2025",
      billedOn: "05 Jun 2025",
      kwh: 315,
      amount: 7400.00,
      kva: 2.3,
    ),
    Bill(
      month: "April 2025",
      billedOn: "05 May 2025",
      kwh: 322,
      amount: 7500.00,
      kva: 2.4,
    ),
    Bill(
      month: "March 2025",
      billedOn: "05 Apr 2025",
      kwh: 308,
      amount: 7100.00,
      kva: 2.1,
    ),
    Bill(
      month: "February 2025",
      billedOn: "05 Mar 2025",
      kwh: 290,
      amount: 6800.00,
      kva: 2.0,
    ),
    Bill(
      month: "January 2025",
      billedOn: "05 Feb 2025",
      kwh: 300,
      amount: 7000.00,
      kva: 2.2,
    ),
    Bill(
      month: "December 2024",
      billedOn: "05 Jan 2025",
      kwh: 280,
      amount: 6600.00,
      kva: 2.0,
    ),
    Bill(
      month: "November 2024",
      billedOn: "05 Dec 2024",
      kwh: 295,
      amount: 6900.00,
      kva: 2.1,
    ),
    Bill(
      month: "October 2024",
      billedOn: "05 Nov 2024",
      kwh: 310,
      amount: 7200.00,
      kva: 2.2,
    ),
    Bill(
      month: "September 2024",
      billedOn: "05 Oct 2024",
      kwh: 275,
      amount: 6400.00,
      kva: 1.9,
    ),
    Bill(
      month: "August 2024",
      billedOn: "05 Sep 2024",
      kwh: 285,
      amount: 6700.00,
      kva: 2.0,
    ),
    Bill(
      month: "July 2024",
      billedOn: "05 Aug 2024",
      kwh: 298,
      amount: 7000.00,
      kva: 2.1,
    ),
    Bill(
      month: "June 2024",
      billedOn: "05 Jul 2024",
      kwh: 270,
      amount: 6200.00,
      kva: 1.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 233, 153),
      appBar: AppBar(
        backgroundColor: const Color(0xFFAE7B21),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Bill Summary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bills.length,
          itemBuilder: (context, index) {
            final bill = bills[index];
            return _buildBillCard(bill);
          },
        ),
      ),
    );
  }

  Widget _buildBillCard(Bill bill) {
    return Card(
      color: const Color(0xFFAE7B21),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromARGB(255, 255, 236, 93),
          width: 2,
        ),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bill.month,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8DE24),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Billed On: ${bill.billedOn}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "KWH: ${bill.kwh}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Amount: Rs. ${bill.amount.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "KVA: ${bill.kva}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Bill {
  final String month;
  final String billedOn;
  final int kwh;
  final double amount;
  final double kva;

  Bill({
    required this.month,
    required this.billedOn,
    required this.kwh,
    required this.amount,
    required this.kva,
  });
}
