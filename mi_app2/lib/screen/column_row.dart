import 'package:flutter/material.dart';

class ColumnRowScreen extends StatefulWidget {
  const ColumnRowScreen({super.key});

  @override
  State<ColumnRowScreen> createState() => _ColumnRowScreenState();
}

class _ColumnRowScreenState extends State<ColumnRowScreen> {
  // Variables de Control de Estado (Fase 4)
  bool _isColumn = true; // true = Modo Column, false = Modo Row
  MainAxisAlignment _mainAlign = MainAxisAlignment.center;
  CrossAxisAlignment _crossAlign = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.star, color: Colors.white),
        title: const Text('Column y Row', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ÁREA DE VISUALIZACIÓN DINÁMICA (Reactiva al estado actual)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // Conmutación interactiva entre Column y Row
                child: _isColumn
                    ? Column(
                        mainAxisAlignment: _mainAlign,
                        crossAxisAlignment: _crossAlign,
                        children: _generarBloquesABC(),
                      )
                    : Row(
                        mainAxisAlignment: _mainAlign,
                        crossAxisAlignment: _crossAlign,
                        children: _generarBloquesABC(),
                      ),
              ),
            ),

            // COLUMN DE CONTROLES REACTIVOS
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW 1: CONTROL DE MODO INTERACTIVO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Modo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Row(
                          children: [
                            const Text('Row'),
                            Switch(
                              value: _isColumn, // Controlado por variable
                              onChanged: (val) {
                                setState(() {
                                  _isColumn = val;
                                });
                              },
                            ),
                            const Text('Column'),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    // ROW 2: CONTROL INTERACTIVO MAIN AXIS
                    const Text('mainAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _botonMain('start', MainAxisAlignment.start),
                        _botonMain('center', MainAxisAlignment.center),
                        _botonMain('end', MainAxisAlignment.end),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 3: CONTROL INTERACTIVO CROSS AXIS
                    const Text('crossAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _botonCross('start', CrossAxisAlignment.start),
                        _botonCross('center', CrossAxisAlignment.center),
                        _botonCross('end', CrossAxisAlignment.end),
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

  // Métodos auxiliares para renderizado dinámico
  List<Widget> _generarBloquesABC() {
    return [
      _construirBloque('A', Colors.amber),
      _construirBloque('B', Colors.green),
      _construirBloque('C', Colors.blue),
    ];
  }

  Widget _construirBloque(String texto, Color color) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(texto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  Widget _botonMain(String texto, MainAxisAlignment alineacion) {
    final bool activo = _mainAlign == alineacion;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: activo ? Colors.blue.shade50 : null,
        side: BorderSide(color: activo ? Colors.blue : Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: () {
        setState(() {
          _mainAlign = alineacion;
        });
      },
      child: Text(texto, style: TextStyle(color: activo ? Colors.blue.shade700 : Colors.black87)),
    );
  }

  Widget _botonCross(String texto, CrossAxisAlignment alineacion) {
    final bool activo = _crossAlign == alineacion;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: activo ? Colors.blue.shade50 : null,
        side: BorderSide(color: activo ? Colors.blue : Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: () {
        setState(() {
          _crossAlign = alineacion;
        });
      },
      child: Text(texto, style: TextStyle(color: activo ? Colors.blue.shade700 : Colors.black87)),
    );
  }
}
