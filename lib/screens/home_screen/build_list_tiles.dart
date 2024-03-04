import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/home_screen/info_by_id.dart';
import 'package:ascensores/screens/quote_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

List<Card> buildListTiles(
    DuctFormProvider valueProvider, BuildContext context) {
  return valueProvider.dataTabla.map((dataItem) {
    return Card(
      child: ListTile(
        title: Text('ID: ${dataItem['id']}'),
        subtitle: Text('User ID: ${dataItem['user_id']}'),
        onTap: () async {
          var infoOfQuote = await getInfoOfTraficStudyById(
              dataItem['id'].toString(), context);
          if (context.mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    QuoteDetail(quoteDetailModel: infoOfQuote),
              ),
            );
          }
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            Alert(
              context: context,
              type: AlertType.warning,
              title: "Eliminar",
              desc: "¿Está seguro de eliminar el estudio de tráfico?",
              buttons: [
                DialogButton(
                  onPressed: () {
                    Navigator.pop(context, false); // Return false if canceled
                  },
                  width: 120,
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.orange[900],
                ),
                DialogButton(
                  onPressed: () {
                    Navigator.pop(context, true); // Return true if confirmed
                  },
                  width: 120,
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.orange[900],
                )
              ],
            ).show().then(
              (value) async {
                if (value != null && value) {
                  final myUserAuthProvider =
                      Provider.of<UserAuthProvider>(context, listen: false);
                  await valueProvider.deleteRowFromTable(
                      dataItem['id'].toString(),
                      myUserAuthProvider.getTokenUser());
                  valueProvider.dataTabla
                      .removeWhere((item) => item['id'] == dataItem['id']);
                }
              },
            );
          },
        ),
      ),
    );
  }).toList();
}
