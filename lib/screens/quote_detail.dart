import 'package:flutter/material.dart';

class QuoteDetail extends StatelessWidget {
  final dynamic quoteDetailModel;
  const QuoteDetail({super.key, required this.quoteDetailModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(quoteDetailModel.toString())],
      ),
    );
  }
}