import 'package:flutter/material.dart';

class QuoteDetail extends StatelessWidget {
  final dynamic quoteDetailModel;

  QuoteDetail({Key? key, required this.quoteDetailModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detalles de la cotización'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              title: 'Información del edificio',
              icon: Icons.home,
              children: [
                _buildInfoRow(
                    'Tipo de edificio', quoteDetailModel['building_type_id']),
                _buildInfoRow('Número de pisos', quoteDetailModel['floors']),
                _buildInfoRow(
                    'Número total de paradas', quoteDetailModel['stops']),
              ],
            ),
            SizedBox(height: 16),
            _buildInfoCard(
              title: 'Especificaciones del ascensor',
              icon: Icons.elevator,
              children: [
                _buildInfoRow('Capacidad máxima de pasajeros',
                    quoteDetailModel['capacity']),
                _buildInfoRow(
                    'Velocidad del ascensor', quoteDetailModel['velocity']),
                _buildInfoRow('Ancho de la puerta del ascensor',
                    quoteDetailModel['capacity_door_width']),
              ],
            ),
            SizedBox(height: 16),
            _buildInfoCard(
              title: 'Velocidades y tiempos de viaje',
              icon: Icons.access_time,
              children: [
                _buildInfoRow(
                    'Salto promedio', quoteDetailModel['average_jump']),
                _buildInfoRow(
                    'Tiempo total de viaje', quoteDetailModel['total_time']),
              ],
            ),
            SizedBox(height: 16),
            _buildInfoCard(
              title: 'Información de la población',
              icon: Icons.people,
              children: [
                _buildInfoRow('Población total en el edificio',
                    quoteDetailModel['total_population']),
                _buildInfoRow('Población servida por el ascensor',
                    quoteDetailModel['served_population']),
                _buildInfoRow('Pasajeros a ser transportados',
                    quoteDetailModel['passengers_to_be_transported']),
              ],
            ),
            SizedBox(height: 16),
            _buildInfoCard(
              title: 'Otros datos relevantes',
              icon: Icons.info,
              children: [
                _buildInfoRow('¿Es hospital?',
                    quoteDetailModel['is_hospital'] == true ? 'Sí' : 'No'),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

//PARA MOSTRAR TODA LA INFORMACIÓN:
// import 'package:flutter/material.dart';

// class QuoteDetail extends StatelessWidget {
//   final dynamic quoteDetailModel;

//   QuoteDetail({Key? key, required this.quoteDetailModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalles de la cotización'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildInfoCard(
//               title: 'Información del edificio',
//               icon: Icons.home,
//               children: [
//                 _buildInfoRow('Tipo de edificio', quoteDetailModel['building_type_id']),
//                 _buildInfoRow('Número de pisos', quoteDetailModel['floors']),
//                 _buildInfoRow('Número total de paradas', quoteDetailModel['stops']),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildInfoCard(
//               title: 'Capacidades y especificaciones del ascensor',
//               icon: Icons.elevator,
//               children: [
//                 _buildInfoRow('Capacidad máxima de pasajeros', quoteDetailModel['capacity']),
//                 _buildInfoRow('Capacidad máxima de carga (kg)', quoteDetailModel['capacity_kgs']),
//                 _buildInfoRow('Capacidad del cubo (frontal)', quoteDetailModel['capacity_cube_front']),
//                 _buildInfoRow('Capacidad del cubo (trasero)', quoteDetailModel['capacity_cube_back']),
//                 _buildInfoRow('Capacidad de la plataforma (frontal)', quoteDetailModel['capacity_platform_front']),
//                 _buildInfoRow('Capacidad de la plataforma (trasera)', quoteDetailModel['capacity_platform_back']),
//                 _buildInfoRow('Ancho de la puerta del ascensor', quoteDetailModel['capacity_door_width']),
//                 _buildInfoRow('Altura de la puerta del ascensor', quoteDetailModel['capacity_door_height']),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildInfoCard(
//               title: 'Velocidades y tiempos de viaje',
//               icon: Icons.access_time,
//               children: [
//                 _buildInfoRow('Velocidad del ascensor', quoteDetailModel['velocity']),
//                 _buildInfoRow('Tiempo de viaje para paradas parciales', quoteDetailModel['travel_time_for_partial_stops']),
//                 _buildInfoRow('Tiempo de viaje para pisos express', quoteDetailModel['travel_time_for_express_floors']),
//                 _buildInfoRow('Salto promedio', quoteDetailModel['average_jump']),
//                 _buildInfoRow('Velocidad nominal desarrollada', quoteDetailModel['nominal_developed_velocity']),
//                 _buildInfoRow('Tiempo de aceleración y desaceleración', quoteDetailModel['acceleration_and_deceleration_time']),
//                 _buildInfoRow('Tiempo de apertura y cierre de puerta', quoteDetailModel['door_opening_and_closing_time']),
//                 _buildInfoRow('Tiempo de entrada y salida de pasajeros', quoteDetailModel['passenger_entry_and_exit_time']),
//                 _buildInfoRow('Tiempo de nivelación', quoteDetailModel['leveling_time']),
//                 _buildInfoRow('Tiempo de recuperación', quoteDetailModel['recovery_time']),
//                 _buildInfoRow('Tiempo total de viaje', quoteDetailModel['total_time']),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildInfoCard(
//               title: 'Información de la población',
//               icon: Icons.people,
//               children: [
//                 _buildInfoRow('Población total en el edificio', quoteDetailModel['total_population']),
//                 _buildInfoRow('Población servida por el ascensor', quoteDetailModel['served_population']),
//                 _buildInfoRow('Pasajeros a ser transportados', quoteDetailModel['passengers_to_be_transported']),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildInfoCard(
//               title: 'Otros datos relevantes',
//               icon: Icons.info,
//               children: [
//                 _buildInfoRow('¿Es hospital?', quoteDetailModel['is_hospital'] == 1 ? 'Sí' : 'No'),
//                 _buildInfoRow('Creado en', quoteDetailModel['created_at']),
//                 _buildInfoRow('Actualizado en', quoteDetailModel['updated_at']),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard({required String title, required IconData icon, required List<Widget> children}) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, color: Colors.blue),
//                 SizedBox(width: 8),
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             ...children,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, dynamic value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             value.toString(),
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
