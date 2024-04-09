import 'dart:io';
import 'package:ascensores/screens/create_project_page/study_trafic_screen_form.dart';
import 'package:ascensores/test_graphic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class DuctPlaneTest extends StatefulWidget {
  final dataForm;

  const DuctPlaneTest({
    super.key,
    required Map<String, dynamic> this.dataForm,
  });

  @override
  State<DuctPlaneTest> createState() => _DuctPlaneTestState();
}

class _DuctPlaneTestState extends State<DuctPlaneTest> {
  ScreenshotController screenshotController = ScreenshotController();
  File? capturedImage;

  final ExportDelegate exportDelegate = ExportDelegate();

  Future<void> saveFile(document, String name) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    // final File file = File('${dir.path}/$name.pdf');
    final File file = File('${dir.path}/Ductos_nombre_del_proyecto.pdf');

    await file.writeAsBytes(await document.save());
    print('Saved exported PDF at: ${file.path}');
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
        shadowColor: Colors.blue[900],
        elevation: 5.0,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Plano generado',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Screenshot(
                controller: screenshotController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Titulo del proyecto",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TestGraphic(
                      anchoDucto: widget.dataForm['anchoDucto'],
                      fondoDucto: widget.dataForm['fondoDucto'],
                      anchoCabina: widget.dataForm['anchoCabina'],
                      fondoCabina: widget.dataForm['fondoCabina'],
                      anchoPuerta: widget.dataForm['anchoPuerta'],
                    ),
                    Text("* El gráfico no refleja las medidas exactas")
                  ],
                ),
              ),
            ), // Centra el TestGraphic() en el espacio disponible
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => printDoc(),
                  child: const Text(
                    "PDF",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
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
                        ),
                      ),
                    );
                  },
                  child: const Text("Estudio de tráfico"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
