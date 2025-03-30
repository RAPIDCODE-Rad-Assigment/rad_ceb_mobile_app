import 'package:flutter/material.dart';

class Interruptions extends StatefulWidget {
  const Interruptions({super.key});

  @override
  State<Interruptions> createState() => _InterruptionsState();
}

class _InterruptionsState extends State<Interruptions> {
  final List<Interruption> interruptions = [
    Interruption(
      date: "01 Apr 2025",
      time: "10:00 AM - 2:00 PM",
      location: "Colombo 07",
      reason: "Scheduled Maintenance",
    ),
    Interruption(
      date: "02 Apr 2025",
      time: "9:00 AM - 12:00 PM",
      location: "Kandy",
      reason: "Emergency Repairs",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 156, 43),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: interruptions.length,
          itemBuilder: (context, index) {
            final interruption = interruptions[index];
            return _buildInterruptionCard(interruption);
          },
        ),
      ),
    );
  }

  Widget _buildInterruptionCard(Interruption interruption) {
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
              interruption.date,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8DE24),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Time: ${interruption.time}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Location: ${interruption.location}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Reason: ${interruption.reason}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Interruption {
  final String date;
  final String time;
  final String location;
  final String reason;

  Interruption({
    required this.date,
    required this.time,
    required this.location,
    required this.reason,
  });
}
