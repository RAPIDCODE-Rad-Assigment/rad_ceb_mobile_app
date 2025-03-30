import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      date: "17 Feb",
      title: "Bill Issued",
      description: "Bill ID\n01202501063974",
      color: Color(0xFFF8DE24),
      icon: Icons.receipt,
    ),
    Event(
      date: "14 Mar",
      title: "Payment Made",
      description: "Payment amount\nRs.272.81\nMade at INTEREST PAYMENT",
      color: Color(0xFFAE7B21),
      icon: Icons.payment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            events.map((event) {
              final isLast = events.indexOf(event) == events.length - 1;
              return TimelineItem(event: event, isLast: isLast);
            }).toList(),
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final Event event;
  final bool isLast;

  TimelineItem({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Circle Indicator
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: event.color,
                shape: BoxShape.circle,
              ),
              child: Icon(event.icon, size: 12, color: Colors.black),
            ),
            // Vertical Line
            if (!isLast) Container(width: 4, height: 50, color: Colors.grey),
          ],
        ),
        const SizedBox(width: 16),
        // Event Details Box
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.date,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  event.description,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Event {
  final String date;
  final String title;
  final String description;
  final Color color;
  final IconData icon;

  Event({
    required this.date,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
  });
}
