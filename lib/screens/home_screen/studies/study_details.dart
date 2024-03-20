import 'package:flutter/material.dart';

class StudyDetails extends StatelessWidget {
  final dynamic studyData;

  StudyDetails({Key? key, required this.studyData}) : super(key: key);

  final testBuildingUseDropdownList = {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalles del Estudio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              title: 'Información del edificio',
              icon: Icons.home,
              children: [
                _buildInfoRow(
                  'Tipo de edificio',
                  testBuildingUseDropdownList.entries
                      .firstWhere(
                          (entry) =>
                              entry.value ==
                              studyData['building_type_id'].toString(),
                          orElse: () => const MapEntry('', ''))
                      .key,
                ),
                _buildInfoRow('Número de pisos', studyData['floors']),
                _buildInfoRow('Número total de paradas', studyData['stops']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Especificaciones del ascensor',
              icon: Icons.elevator,
              children: [
                _buildInfoRow(
                    'Capacidad máxima de pasajeros', studyData['capacity']),
                _buildInfoRow('Velocidad del ascensor', studyData['velocity']),
                _buildInfoRow('Ancho de la puerta del ascensor',
                    studyData['capacity_door_width']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Velocidades y tiempos de viaje',
              icon: Icons.access_time,
              children: [
                _buildInfoRow('Salto promedio', studyData['average_jump']),
                _buildInfoRow('Tiempo total de viaje', studyData['total_time']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Información de la población',
              icon: Icons.people,
              children: [
                _buildInfoRow('Población total en el edificio',
                    studyData['total_population']),
                _buildInfoRow('Población servida por el ascensor',
                    studyData['served_population']),
                _buildInfoRow('Pasajeros a ser transportados',
                    studyData['passengers_to_be_transported']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Otros datos relevantes',
              icon: Icons.info,
              children: [
                _buildInfoRow('¿Es hospital?',
                    studyData['is_hospital'] == 1 ? 'Sí' : 'No'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title,
      required IconData icon,
      required List<Widget> children}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
