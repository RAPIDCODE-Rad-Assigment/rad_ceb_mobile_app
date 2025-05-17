import 'package:flutter/material.dart';

import 'TimelineTile.dart';

class TimelineScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      date: "15 May 2025",
      title: "Payment Made",
      description: "Payment amount\nRs.1,298.65\nAuto-debited from Bank",
      icon: "payment",
    ),
    Event(
      date: "02 May 2025",
      title: "Bill Issued",
      description: "Bill ID\n01202505067890",
      icon: "bill",
    ),
    Event(
      date: "16 Apr 2025",
      title: "Payment Made",
      description: "Payment amount\nRs.1,215.40\nMade at INTEREST PAYMENT",
      icon: "payment",
    ),
    Event(
      date: "03 Apr 2025",
      title: "Bill Issued",
      description: "Bill ID\n01202504062345",
      icon: "bill",
    ),
    Event(
      date: "29 Mar 2025",
      title: "Payment Made",
      description: "Payment amount\nRs.1,315.00\nPaid through Mobile App",
      icon: "payment",
    ),
    Event(
      date: "17 Mar 2025",
      title: "Bill Issued",
      description: "Bill ID\n01202503068923",
      icon: "bill",
    ),
    Event(
      date: "18 Feb 2025",
      title: "Payment Made",
      description: "Payment amount\nRs.1,102.75\nPaid at CEB Kiosk",
      icon: "payment",
    ),
    Event(
      date: "04 Feb 2025",
      title: "Bill Issued",
      description: "Bill ID\n01202502064567",
      icon: "bill",
    ),
    Event(
      date: "20 Jan 2025",
      title: "Payment Made",
      description: "Payment amount\nRs.1,230.50\nMade via Online Banking",
      icon: "payment",
    ),
    Event(
      date: "05 Jan 2025",
      title: "Bill Issued",
      description: "Bill ID\n01202501061234",
      icon: "bill",
    ),
  ];

  TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, bottom: 30.0, right: 30.0),
      child: SizedBox(
        height: 500.0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                events.map((event) {
                  final isFirst = events.indexOf(event) == 0;
                  final isLast = events.indexOf(event) == events.length - 1;
                  final isPast = isLast ? false : true;

                  return TimeLineTile(
                    isFirst: isFirst,
                    isLast: isLast,
                    isPast: isPast,
                    icon: event.icon,
                    date: event.date,
                    title: event.title,
                    description: event.description,
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}

class Event {
  final String date;
  final String title;
  final String description;
  final String icon;

  Event({
    required this.date,
    required this.title,
    required this.description,
    required this.icon,
  });
}
