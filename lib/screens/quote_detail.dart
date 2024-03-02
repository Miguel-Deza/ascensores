import 'package:flutter/material.dart';

class QuoteDetail extends StatelessWidget {
  var quoteDetailModel;
  QuoteDetail({super.key, required this.quoteDetailModel});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(quoteDetailModel.toString())],
      ),
    );
  }
}
 