import 'package:http/http.dart' as http;

String token = '63|KyIGsxMpFmFs8z99qsapVb9Tncr8sXzhll1Afbo856bbfc3f';

Future<bool> isLogOutUser() async {
  // URL del endpoint
  const String apiUrl = 'https://dev.ktel.pe/api/logout';
  try {
    // Crear la solicitud HTTP
    http.Request request = http.Request('POST', Uri.parse(apiUrl));
    // Agregar el encabezado de autorización con el token
    request.headers['Authorization'] =
        'Bearer 65|RPsmMqiyRRyyszi03Zof7Ar93qlaOgtO24fuBwiT8cbeb6e6';
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    return false;
  }
}

void main() async {
  bool logout = await isLogOutUser();
  print(logout);
  return;
}
