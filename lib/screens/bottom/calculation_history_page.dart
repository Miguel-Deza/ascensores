import 'package:flutter/material.dart';

class CalculationHistoryPage extends StatefulWidget {
  const CalculationHistoryPage({super.key});

  @override
  State<CalculationHistoryPage> createState() => _CalculationHistoryPageState();
}

class _CalculationHistoryPageState extends State<CalculationHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Descripción')),
                  DataColumn(label: Text('Marca')),
                  DataColumn(label: Text('Modelo')),
                  DataColumn(label: Text('Proyecto')),
                  DataColumn(label: Text('Fecha de registro')),
                  DataColumn(label: Text('Estado')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 1')),
                    DataCell(Text('⚙️ Marca A')),
                    DataCell(Text('👤 Modelo 123')),
                    DataCell(Text('🏢 Proyecto X')),
                    DataCell(Text('📅 2024-02-22')),
                    DataCell(Text('📗 Activo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 1
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 1
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('🔢 Producto 2')),
                    DataCell(Text('⚙️ Marca B')),
                    DataCell(Text('👤 Modelo 456')),
                    DataCell(Text('🏢 Proyecto Y')),
                    DataCell(Text('📅 2024-02-21')),
                    DataCell(Text('⭕ Inactivo')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar la fila 2
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar la fila 2
                          },
                        ),
                      ],
                    )),
                  ]),

                  // Puedes agregar más filas aquí según sea necesario
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
