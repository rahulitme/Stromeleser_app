import 'package:flutter/material.dart';

class DeviceImageWidget extends StatefulWidget {
  const DeviceImageWidget({super.key});

  @override
  State<DeviceImageWidget> createState() => _DeviceImageWidgetState();
}

class _DeviceImageWidgetState extends State<DeviceImageWidget> {
  double _rotation = 0.0;
  Offset? _startPosition;

  void _onPanStart(DragStartDetails details) {
    _startPosition = details.localPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_startPosition == null) return;

    // Calculate the center of the widget
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final center = Offset(renderBox.size.width / 2, renderBox.size.height / 2);

    // Calculate angles
    final startAngle = (_startPosition! - center).direction;
    final currentAngle = (details.localPosition - center).direction;

    setState(() {
      // Update rotation based on the difference in angles
      _rotation += (currentAngle - startAngle);
      _startPosition = details.localPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _startPosition = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: Container(
          width: 200, // Increased size for better interaction
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          child: Transform.rotate(
            angle: _rotation,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/1.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
