import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/home_screen/info_by_id.dart';
import 'package:ascensores/screens/quote_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            final myUserAuthProvider =
                Provider.of<UserAuthProvider>(context, listen: false);
            await valueProvider.deleteRowFromTable(
                dataItem['id'].toString(), myUserAuthProvider.getTokenUser());
            valueProvider.dataTabla
                .removeWhere((item) => item['id'] == dataItem['id']);
          },
        ),
      ),
    );
  }).toList();
}
