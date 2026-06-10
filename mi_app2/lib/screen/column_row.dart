import 'package:flutter/material.dart';

class ColumnRowScreen extends StatelessWidget {
  const ColumnRowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR -> ICON -> TEXT
      appBar: AppBar(
        leading: const Icon(Icons.star), // Icon de tu diagrama
        title: const Text('Column y Row'), // Text (columna / row)
      ),
      // BODY (Un Column principal para albergar tus 4 bloques directos)
      body: Column(
        children: [
          // 1. CONTAINER -> TEXT (Bloque A)
          Container(
            child: const Text('A'),
          ),

          // 2. CONTAINER -> TEXT (Bloque B)
          Container(
            child: const Text('B'),
          ),

          // 3. CONTAINER -> TEXT (Bloque C)
          Container(
            child: const Text('C'),
          ),

          // 4. COLUMN (El bloque de controles de abajo)
          Column(
            children: [
              // Primera ROW -> TEXT y SWITCH
              Row(
                children: [
                  const Text('Modo: Column'),
                  Switch(value: true, onChanged: (val) {}),
                ],
              ),
              
              // Segunda ROW -> TEXT y BUTTON
              Row(
                children: [
                  const Text('mainAxisAlignment:'),
                  ElevatedButton(onPressed: () {}, child: const Text('Center')),
                ],
              ),

              // Tercera ROW -> TEXT y BUTTON
              Row(
                children: [
                  const Text('crossAxisAlignment:'),
                  ElevatedButton(onPressed: () {}, child: const Text('Center')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
