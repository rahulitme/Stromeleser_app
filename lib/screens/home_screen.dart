import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/%20widgets/device_image_widget.dart';
import 'package:myapp/%20widgets/energy_widget.dart';
import 'package:myapp/%20widgets/power_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _consumption = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to simulate real-time energy consumption updates
    _startEnergyMeter();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  // Function to start simulating energy consumption
  void _startEnergyMeter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Simulate the consumption increase (replace with actual device data)
        _consumption += _getSimulatedEnergyUsage();
      });
    });
  }

  // This simulates getting a random energy usage value from a device
  int _getSimulatedEnergyUsage() {
    return 5; // Fixed increment for simplicity, adjust as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Meter'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DeviceImageWidget(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Active', // Displaying the status of the meter
                    style: TextStyle(fontSize: 24, color: Colors.greenAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PowerButton(icon: Icons.power_settings_new),
                PowerButton(icon: Icons.schedule),
              ],
            ),
            const Spacer(),
            EnergyWidget(consumption: _consumption),
          ],
        ),
      ),
    );
  }
}
