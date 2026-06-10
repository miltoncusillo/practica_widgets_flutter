import 'package:flutter/material.dart';

class ElementosUiScreen extends StatefulWidget {
  const ElementosUiScreen({super.key});

  @override
  State<ElementosUiScreen> createState() => _ElementosUiScreenState();
}

class _ElementosUiScreenState extends State<ElementosUiScreen> {
  // Variables de Control de Estado (Fase 4)
  double _fontSize = 32.0;
  bool _isBold = false;
  bool _isItalic = false;
  TextAlign _alignmentText = TextAlign.center;
  Color _colorTexto = Colors.blue;

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
            // ÁREA DE VISUALIZACIÓN (Texto reactivo a los controles inferiores)
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Hola Flutter',
                  textAlign: _alignmentText,
                  style: TextStyle(
                    fontSize: _fontSize,
                    fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
                    fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
                    color: _colorTexto,
                  ),
                ),
              ),
            ),

            // COLUMN DE CONTROLES REACTIVOS
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW 1: SLIDER DE TAMAÑO DE FUENTE
                    Text('fontSize: ${_fontSize.toInt()}', style: const TextStyle(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: _fontSize,
                            min: 16,
                            max: 60,
                            onChanged: (val) {
                              setState(() {
                                _fontSize = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // ROW 2: INTERRUPTORES DE ESTILO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text('Bold: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            Switch(
                              value: _isBold,
                              onChanged: (val) {
                                setState(() {
                                  _isBold = val;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Italic: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            Switch(
                              value: _isItalic,
                              onChanged: (val) {
                                setState(() {
                                  _isItalic = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 3: BOTONES DE ALINEACIÓN DE TEXTO
                    const Text('Alineación:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _construirBotonAlineacion(Icons.format_align_left, TextAlign.left),
                        _construirBotonAlineacion(Icons.format_align_center, TextAlign.center),
                        _construirBotonAlineacion(Icons.format_align_right, TextAlign.right),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 4: PALETA DE SELECCIÓN DE COLOR
                    const Text('Color:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _construirBotonColor(Colors.blue),
                        _construirBotonColor(Colors.red),
                        _construirBotonColor(Colors.green),
                        _construirBotonColor(Colors.amber),
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

  Widget _construirBotonAlineacion(IconData icono, TextAlign alineacionTarget) {
    final bool seleccionado = _alignmentText == alineacionTarget;
    return IconButton(
      icon: Icon(icono, color: seleccionado ? Colors.blue : Colors.grey.shade600),
      onPressed: () {
        setState(() {
          _alignmentText = alineacionTarget;
        });
      },
    );
  }

  Widget _construirBotonColor(Color colorTarget) {
    final bool seleccionado = _colorTexto == colorTarget;
    return GestureDetector(
      onTap: () {
        setState(() {
          _colorTexto = colorTarget;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: seleccionado ? Border.all(color: Colors.blue, width: 2) : null,
        ),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: colorTarget,
          child: seleccionado ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
        ),
      ),
    );
  }
}
