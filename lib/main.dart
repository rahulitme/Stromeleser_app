import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const StromleserApp());
}

class StromleserApp extends StatelessWidget {
  const StromleserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stromleser App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
