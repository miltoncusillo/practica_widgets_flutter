import 'package:flutter/material.dart';

class ElementosUiScreen extends StatelessWidget {
  const ElementosUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.widgets, color: Colors.white),
        title: const Text('Elementos UI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TEXT PRINCIPAL ("Hola Flutter")
            const Expanded(
              child: Center(
                child: Text(
                  'Hola Flutter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            // COLUMN DE CONTROLES (DENTRO DE UNA CARD ESTILIZADA)
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW 1: SLIDER FONT SIZE
                    const Text('fontSize: 32', style: TextStyle(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(value: 32.0, min: 16, max: 60, onChanged: (val) {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // ROW 2: SWITCHES DE ESTILO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text('Bold: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            Switch(value: true, onChanged: (val) {}),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Italic: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            Switch(value: false, onChanged: (val) {}),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 3: ICON BUTTON ALINEACIÓN
                    const Text('Alineación:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_left, color: Colors.blue)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_center, color: Colors.grey)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_right, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 4: PALETA DE COLORES (CIRCLE AVATARS)
                    const Text('Color:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _construirIndicadorColor(Colors.blue, true),
                        _construirIndicadorColor(Colors.red, false),
                        _construirIndicadorColor(Colors.green, false),
                        _construirIndicadorColor(Colors.amber, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirIndicadorColor(Color color, bool seleccionado) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: seleccionado ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: color,
        child: seleccionado ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
      ),
    );
  }
}
