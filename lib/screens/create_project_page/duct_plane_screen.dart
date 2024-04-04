import 'dart:io';
import 'package:ascensores/screens/create_project_page/study_trafic_screen_form.dart';
import 'package:ascensores/screens/trafic_study/elevator_sizing/graphic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class DuctPlaneScreen extends StatefulWidget {
  final dataForm;
  final ducto;
  final dimensionesCabina;
  final pasoLibre;

  const DuctPlaneScreen(
      {super.key,
      required Map<String, dynamic> this.dataForm,
      this.ducto,
      this.dimensionesCabina,
      this.pasoLibre});

  @override
  State<DuctPlaneScreen> createState() => _DuctPlaneScreenState();
}

class _DuctPlaneScreenState extends State<DuctPlaneScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  File? capturedImage;

  final ExportDelegate exportDelegate = ExportDelegate();
  Future<void> saveFile(document, String name) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/$name.pdf');

    await file.writeAsBytes(await document.save());
    debugPrint('Saved exported PDF at: ${file.path}');
  }

  Future<void> printDoc() async {
    final capturedImageFile = await _captureAndSaveImage();
    if (capturedImageFile == null) return;
    final doc = pw.Document();
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(pw.MemoryImage(capturedImageFile.readAsBytesSync())),
        );
      },
    ));
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }

  Future<File?> _captureAndSaveImage() async {
    final imageBytes = await screenshotController.capture();
    if (imageBytes == null) return null; // Handle potential capture failure

    final tempDir = await getTemporaryDirectory(); // Get temporary directory
    final tempFile = File('${tempDir.path}/screenshot.png'); // Create a file

    await tempFile.writeAsBytes(imageBytes); // Write image data to file

    return tempFile; // Return the captured image file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plano generado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Screenshot(
            controller: screenshotController,
            child: Graphic(
              ducto:
                  "${widget.dataForm['anchoDucto']}x${widget.dataForm['fondoDucto']}",
              dimensionesCabina:
                  "${widget.dataForm['anchoCabina']}x${widget.dataForm['fondoCabina']}",
              pasoLibre: "${widget.dataForm['anchoPuerta']}",
            ),
          ),
          capturedImage != null
              ? Image.file(capturedImage!, fit: BoxFit.cover)
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => printDoc(),
                  child: const Text("PDF"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Link"),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudyTraficScreenForm(
                            dataForm: widget.dataForm,
                          )),
                );
              },
              child: const Text("Estudio de tráfico"),
            ),
          )
        ],
      ),
    );
  }
}
