import 'package:flutter/material.dart';

class QuoteDetails extends StatelessWidget {
  final dynamic dataQuote;
  const QuoteDetails({Key? key, this.dataQuote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la cotización'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            _buildInfoCard(
              title: 'Información general del proyecto',
              icon: Icons.home,
              children: [
                ListTile(
                  title: const Text(
                    'Nombre del proyecto',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(dataQuote['project']),
                ),
                ListTile(
                  title: const Text(
                    'Descripción del proyecto',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(dataQuote['description']),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Información general del proyecto',
              icon: Icons.info,
              children: [
                _buildInfoRow('ID', dataQuote['id']),
                _buildInfoRow('Uso', dataQuote['usage']),
                _buildInfoRow('Estado', dataQuote['status']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Detalles del elevador',
              icon: Icons.elevator,
              children: [
                _buildInfoRow('Marca', dataQuote['brand']),
                _buildInfoRow('Modelo', dataQuote['model']),
                _buildInfoRow('Velocidad', dataQuote['velocity']),
                _buildInfoRow(
                    'Número de paradas', dataQuote['stops'].toString()),
                _buildInfoRow('Material del piso', dataQuote['floor_material']),
                _buildInfoRow('Acceso doble',
                    dataQuote['double_access'] == 1 ? 'Sí' : 'No'),
                _buildInfoRow(
                    'Caras panorámicas', dataQuote['panoramic_faces']),
                _buildInfoRow(
                    'Ancho de puerta', dataQuote['door_width'].toString()),
                _buildInfoRow('Altura', dataQuote['height'].toString()),
                _buildInfoRow(
                    'Material de la cabina', dataQuote['cabin_material']),
                _buildInfoRow('Tipo de cabina', dataQuote['cabin_type']),
                _buildInfoRow('Piso de la cabina', dataQuote['cabin_floor']),
                _buildInfoRow('Techo de la cabina', dataQuote['cabin_ceiling']),
                _buildInfoRow(
                    'Pasamanos de la cabina', dataQuote['cabin_handrail']),
                _buildInfoRow(
                    'Dimensiones de la cabina', dataQuote['cabin_dimensions']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Características adicionales',
              icon: Icons.add,
              children: [
                _buildInfoRow('Controlador del marco',
                    dataQuote['door_frame_controller']),
                _buildInfoRow(
                    'Marcador automático', dataQuote['automatic_marker']),
                _buildInfoRow(
                    'Sintetizador de voz', dataQuote['voice_synthesizer']),
                _buildInfoRow('Timbre', dataQuote['gong']),
                _buildInfoRow('Cop de bomberos', dataQuote['firefighters_cop']),
                _buildInfoRow('Lop de bomberos', dataQuote['firefighters_lop']),
                _buildInfoRow('Ventiladores', dataQuote['fans']),
                _buildInfoRow('Sensor sísmico', dataQuote['seismic_sensor']),
                _buildInfoRow('Transformador', dataQuote['transformer']),
                _buildInfoRow('Cable extra', dataQuote['extra_cable']),
                _buildInfoRow('Lector de tarjetas inalámbrico',
                    dataQuote['wireless_card_reader']),
                _buildInfoRow(
                    'Tarjetas inalámbricas', dataQuote['wireless_cards']),
                _buildInfoRow('TFT en cabina', dataQuote['tft_cabin']),
                _buildInfoRow('TFT en piso', dataQuote['tft_floor']),
                _buildInfoRow('Sistema de bloqueo de llave',
                    dataQuote['key_lock_system']),
                _buildInfoRow('LCD en cabina', dataQuote['lcd_cabin']),
                _buildInfoRow('LCD en piso', dataQuote['lcd_floor']),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Costos y gastos',
              icon: Icons.attach_money,
              children: [
                _buildInfoRow('Total', dataQuote['total']),
                _buildInfoRow('Costo de importación',
                    dataQuote['importation_cost'] ?? 'Null'),
                _buildInfoRow('Costo FOB', dataQuote['fob_cost'] ?? 'Null'),
                _buildInfoRow('Gastos de aduana',
                    dataQuote['customs_expenses'] ?? 'Null'),
                _buildInfoRow(
                    'Costo de paradas', dataQuote['stops_cost'] ?? 'Null'),
                _buildInfoRow(
                    'Adicional de parada', dataQuote['stop_add'] ?? 'Null'),
                _buildInfoRow('Costo de instalación',
                    dataQuote['installation_cost'] ?? 'Null'),
                _buildInfoRow('Viaje', dataQuote['travel'] ?? 'Null'),
                _buildInfoRow(
                    'Sobrecarrera', dataQuote['overtravel'] ?? 'Null'),
                _buildInfoRow('Foso', dataQuote['pit'] ?? 'Null'),
                _buildInfoRow(
                    'Trabajo de dintel', dataQuote['work_lintel'] ?? 'Null'),
                _buildInfoRow('Dimensiones de la caja',
                    dataQuote['box_dimensions'] ?? 'Null'),
                _buildInfoRow('Ménsulas', dataQuote['corbels'] ?? 'Null'),
                _buildInfoRow(
                    'Tiempo de trabajo', dataQuote['t_work'] ?? 'Null'),
                _buildInfoRow('Meses de mantenimiento',
                    dataQuote['maintenance_months'] ?? 'Null'),
                _buildInfoRow('Costo de mantenimiento',
                    dataQuote['maintenance_cost'] ?? 'Null'),
                _buildInfoRow('Comisión', dataQuote['commission'] ?? 'Null'),
                _buildInfoRow('Margen', dataQuote['margin'] ?? 'Null'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: 'Información',
              icon: Icons.person,
              children: [
                _buildInfoRow('ID de usuario', dataQuote['user_id'].toString()),
                _buildInfoRow(
                    'ID del vendedor',
                    dataQuote['seller_id'] != null
                        ? dataQuote['seller_id'].toString()
                        : 'Null'),
              ],
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    );
  }
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
