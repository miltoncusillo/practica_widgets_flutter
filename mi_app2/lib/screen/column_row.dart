import 'package:flutter/material.dart';

class ColumnRowScreen extends StatelessWidget {
  const ColumnRowScreen({super.key});

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
            // 1. CONTAINER A
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),

            // 2. CONTAINER B
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text('B', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),

            // 3. CONTAINER C
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 24.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Text('C', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),

            // 4. COLUMN DE CONTROLES (ESTILIZADA)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW 1: SWITCH MODO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Modo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Row(
                          children: [
                            const Text('Column'),
                            Switch(value: true, onChanged: (val) {}),
                            const Text('Row'),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    // ROW 2: MAIN AXIS
                    const Text('mainAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(onPressed: () {}, child: const Text('start')),
                        ElevatedButton(onPressed: () {}, child: const Text('center')),
                        OutlinedButton(onPressed: () {}, child: const Text('end')),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ROW 3: CROSS AXIS
                    const Text('crossAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(onPressed: () {}, child: const Text('start')),
                        ElevatedButton(onPressed: () {}, child: const Text('center')),
                        OutlinedButton(onPressed: () {}, child: const Text('end')),
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
}
