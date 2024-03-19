import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final child;
  const EventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Colors.blue.shade900 : Colors.blue.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
