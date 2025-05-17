import 'package:flutter/material.dart';
import 'dart:math';

class MeterReadings extends StatefulWidget {
  const MeterReadings({super.key});

  @override
  State<MeterReadings> createState() => _MeterReadingsState();
}

class _MeterReadingsState extends State<MeterReadings> {
  final List<Meter> readings = List.generate(12, (index) {
    final rng = Random();
    return Meter(
      meterSerial: "SN${100000 + index}",
      category: ["Residential", "Commercial", "Industrial"][index % 3],
      bandSequence: "Band ${String.fromCharCode(65 + index % 5)}",
      reading: 100000 + rng.nextInt(900000),
      collectedBy:
          ["John Doe", "Jane Smith", "Admin Unit", "Field Agent"][index % 4],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 233, 153),
      appBar: AppBar(
        backgroundColor: const Color(0xFFAE7B21),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Meter Readings Summary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: readings.length,
          itemBuilder: (context, index) {
            final meter = readings[index];
            return _buildMeterCard(meter);
          },
        ),
      ),
    );
  }

  Widget _buildMeterCard(Meter meter) {
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
              "Serial: ${meter.meterSerial}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8DE24),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Category: ${meter.category}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Band Sequence: ${meter.bandSequence}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Reading: ${meter.reading}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Collected By: ${meter.collectedBy}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Meter {
  final String meterSerial;
  final String category;
  final String bandSequence;
  final int reading;
  final String collectedBy;

  Meter({
    required this.meterSerial,
    required this.category,
    required this.bandSequence,
    required this.reading,
    required this.collectedBy,
  });
}
