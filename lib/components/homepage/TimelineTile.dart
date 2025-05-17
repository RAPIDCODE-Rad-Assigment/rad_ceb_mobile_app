import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String icon;
  final String date;
  final String title;
  final String description;

  const TimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.icon,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.2,
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: Color(0xFF62270A)),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: Color(0xFF62270A),
          iconStyle: IconStyle(
            iconData: icon == "bill" ? Icons.receipt : Icons.payment,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        endChild: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 139, 53, 10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(description, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        startChild: Text(
          date,
          style: TextStyle(
            color: Color(0xFF62270A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
