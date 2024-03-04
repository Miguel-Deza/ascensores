import 'package:flutter/material.dart';

class QuoteDetail extends StatelessWidget {
  final dynamic quoteDetailModel;

  QuoteDetail({Key? key, required this.quoteDetailModel}) : super(key: key);

  // Mapa de conversiones al español
  static const Map<String, String> _keyTranslations = {
    'id': 'ID',
    'user_id': 'ID de usuario',
    'building_type_id': 'ID del tipo de edificio',
    'stops': 'Paradas',
    'height': 'Altura',
    'surface': 'Superficie total',
    'express_floors': 'Pisos express',
    'units_per_level_served': 'Unidades por nivel servido',
    'is_hospital': 'Es hospital',
    'capacity': 'Capacidad',
    'velocity': 'Velocidad',
    'safety_margin': 'Margen de seguridad',
    'door_width': 'Ancho de puerta',
    'door_technology': 'Tecnología de puerta',
    'index': 'Índice',
    'floors': 'Pisos',
    'percentage': 'Porcentaje',
    'total_population': 'Población total',
    'served_population': 'Población servida',
    'capacity_passengers': 'Capacidad de pasajeros',
    'capacity_kgs': 'Capacidad en kg',
    'capacity_platform_front': 'Capacidad de plataforma (frontal)',
    'capacity_platform_back': 'Capacidad de plataforma (trasera)',
    'capacity_cube_front': 'Capacidad de cubo (frontal)',
    'capacity_cube_back': 'Capacidad de cubo (trasera)',
    'capacity_door_width': 'Ancho de puerta de capacidad',
    'capacity_door_height': 'Altura de puerta de capacidad',
    'passengers': 'Pasajeros',
    'served_floors': 'Pisos servidos',
    'probable_stops': 'Paradas probables',
    'total_stops': 'Paradas totales',
    'average_jump': 'Salto promedio',
    'nominal_developed_velocity': 'Velocidad nominal desarrollada',
    'travel_time_for_partial_stops': 'Tiempo de viaje para paradas parciales',
    'travel_time_for_express_floors': 'Tiempo de viaje para pisos express',
    'acceleration_and_deceleration_time':
        'Tiempo de aceleración y desaceleración',
    'false_stops': 'Paradas falsas',
    'door_opening_and_closing_time': 'Tiempo de apertura y cierre de puerta',
    'passenger_entry_and_exit_time': 'Tiempo de entrada y salida de pasajeros',
    'leveling_time': 'Tiempo de nivelación',
    'recovery_time': 'Tiempo de recuperación',
    'total_time': 'Tiempo total',
    'passengers_to_be_transported': 'Pasajeros a ser transportados',
    'cabins_required': 'Cabinas requeridas',
    'waiting_interval': 'Intervalo de espera',
    'created_at': 'Creado en',
    'updated_at': 'Actualizado en',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la cotización'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var entry in quoteDetailModel.entries)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          _keyTranslations[entry.key] ?? entry.key,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          entry.value.toString().substring(
                              0,
                              entry.value.toString().length > 10
                                  ? 10
                                  : entry.value.toString().length),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
