import 'package:flutter/material.dart';

Card generateQuoteCard(
    String titleQuote, String subtitleQuote, onDeleteQuote, onTapQuote) {
  return Card(
    child: ListTile(
      leading: Icon(Icons.elevator),
      title: Text('$titleQuote'),
      subtitle: Text('$subtitleQuote'),
      trailing: IconButton(icon: Icon(Icons.delete), onPressed: onDeleteQuote),
      onTap: () => onTapQuote(),
    ),
  );
}

class CardInfo {
  String title;
  String subtitle;
  CardInfo(this.title, this.subtitle);
}
