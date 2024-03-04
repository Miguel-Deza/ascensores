import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/home_screen/info_by_id.dart';
import 'package:ascensores/screens/quote_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var testBuildingUseDropdownList = {
  "Oficinas céntricas": "1",
  "Oficinas suburbanas": "2",
  "Oficinas corporativas": "3",
  "Edificio gubernamental": "4",
  "Departamentos alta rentabilidad": "5",
  "Departamentos rentabilidad media": "6",
  "Hospital privado": "7",
  "Hospital estatal": "8",
  "Hotel alta rentabilidad cosmopolita": "9",
  "Hotel alta rentabilidad veraneo": "10",
  "Hotel baja rentabilidad cosmopolita": "11",
  "Hotel baja rentabilidad veraneo": "12",
  "Estacionamiento autoservicio": "13",
  "Estacionamiento tienda departamental": "14",
};
List<Card> buildListTiles(
    DuctFormProvider valueProvider, BuildContext context) {
  return valueProvider.dataTabla.map((dataItem) {
    // Obtener el texto correspondiente a partir del ID
    String buildingUseText = ""; // Initialize with an empty string

    try {
      buildingUseText = testBuildingUseDropdownList.entries
          .firstWhere((entry) =>
              entry.value == (dataItem['building_type_id']).toString())
          .key;
    } on StateError {
      // Handle the case where there's no matching entry
      buildingUseText = "ID no encontrado";
    } // Asumo que la clave del mapa es el ID del tipo de edificio

    var parsedDateTime = DateTime.parse(dataItem['created_at']).toLocal();

    return Card(
      child: ListTile(
        title: Text('$buildingUseText'),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_month_outlined),
            SizedBox(width: 5), // Icono de la fecha a la izquierda del texto
            // Espacio entre el icono y el texto
            Text('${DateFormat('dd/MM/yyyy').format(parsedDateTime)}'),
            SizedBox(width: 5),
            Icon(Icons.access_time),
            SizedBox(width: 5),
            Text('${DateFormat('hh:mm a').format(parsedDateTime)}'),
          ],
        ),
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
