import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Balance (LKR)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '81.89',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Pending Clearance LKR 0.00',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text('Account Status: NORMAL', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle PAY NOW action
                },
                child: Text('PAY NOW'),
              ),
              SizedBox(height: 24),
              Text(
                'Recent Bills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                title: Text('Bill value Rs.6,354.87'),
                subtitle: Text('Bill id 01202502062350'),
              ),
              ListTile(
                title: Text('Bill value Rs.5,625.64'),
                subtitle: Text('Bill id 01202501063974'),
              ),
              SizedBox(height: 24),
              Text(
                'Recent Payments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                title: Text('Payment amount Rs.6,000.00'),
                subtitle: Text('Made at PEOPLES BANK IPG - DOMESTIC'),
              ),
              ListTile(
                title: Text('Payment amount Rs.272.81'),
                subtitle: Text(
                  'Made at INTEREST PAYMENT FOR SECURITY DEPOSITS',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
