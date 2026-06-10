import 'package:flutter/material.dart';

class ElementosUiScreen extends StatelessWidget {
  const ElementosUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. APPBAR -> ICON -> TEXT
      appBar: AppBar(
        leading: const Icon(Icons.abc), // icon de tu diagrama
        title: const Text('Elementos UI'), // text
      ),
      // 2. BODY : COLUMN
      body: Column(
        children: [
          // TEXT (El que dice "Hola Flutter")
          const Text('Hola Flutter'),

          // COLUMN (Contenedor de los controles)
          Column(
            children: [
              // Primera ROW -> TEXT y SLIDER
              Row(
                children: [
                  const Text('fontSize: 24'),
                  Slider(value: 24.0, min: 10, max: 50, onChanged: (val) {}),
                ],
              ),

              // Segunda ROW -> TEXT, SWITCH, TEXT, SWITCH
              Row(
                children: [
                  const Text('Bold:'),
                  Switch(value: false, onChanged: (val) {}),
                  const Text('Italic:'),
                  Switch(value: false, onChanged: (val) {}),
                ],
              ),

              // Tercera ROW -> ICON BUTTON, ICON BUTTON, ICON BUTTON
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_left)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_center)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_right)),
                ],
              ),

              // Cuarta ROW -> TEXT y 4 CIRCLE AVATAR
              Row(
                children: [
                  const Text('Color:'),
                  const CircleAvatar(radius: 10, backgroundColor: Colors.blue),
                  const CircleAvatar(radius: 10, backgroundColor: Colors.red),
                  const CircleAvatar(radius: 10, backgroundColor: Colors.green),
                  const CircleAvatar(radius: 10, backgroundColor: Colors.amber),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
