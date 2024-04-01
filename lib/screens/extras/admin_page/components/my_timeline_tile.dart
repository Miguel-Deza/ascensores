import 'package:ascensores/screens/extras/admin_page/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final dynamic eventCard;
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        // decorate the lines
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.blue.shade900 : Colors.blue.shade300,
        ),
        //decorate the icon
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? Colors.blue.shade900 : Colors.blue.shade300,
          iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : Colors.blue.shade300),
        ),
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
        ),
      ),
    );
  }
}
