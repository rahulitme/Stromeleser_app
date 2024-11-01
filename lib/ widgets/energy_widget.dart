import 'package:flutter/material.dart';

class EnergyWidget extends StatelessWidget {
  final int consumption;

  const EnergyWidget({super.key, required this.consumption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Energy Consumption',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consumption (W)',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  Text(
                    '$consumption W', // Display the real-time consumption
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text(
                    '2024-11-01',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
