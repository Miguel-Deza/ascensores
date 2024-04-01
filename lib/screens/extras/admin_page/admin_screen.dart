import 'package:ascensores/screens/extras/admin_page/components/my_timeline_tile.dart';
import 'package:ascensores/screens/extras/admin_page/pdf/pdf_api.dart';
import 'package:ascensores/screens/extras/admin_page/pdf/pdf_viewer_page.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 20, 0),
          child: ListView(
            children: [
              // Start
              MyTimeLineTile(
                isFirst: true,
                isLast: false,
                isPast: true,
                eventCard: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ubicación',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () async {
                        final url =
                            "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";
                        final file = await PDFApi.loadNetwork(url);
                        openPDF(context, file);
                      },
                      icon: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Middle
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                eventCard: Text(
                  'Observaciones',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // End
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                eventCard: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contactos',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () async {
                        final url =
                            "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";
                        final file = await PDFApi.loadNetwork(url);
                        openPDF(context, file);
                      },
                      icon: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              MyTimeLineTile(
                isFirst: false,
                isLast: true,
                isPast: false,
                eventCard: Text(
                  'Requerimientos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
