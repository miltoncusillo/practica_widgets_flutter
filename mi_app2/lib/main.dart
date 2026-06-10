import 'package:flutter/material.dart';
import 'screen/column_row.dart'; 
import 'screen/elementos_ui.dart';


void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PantallaMenu(),
    );
  }
}

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Widgets'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: [
          ///// primer item
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.star, color: Colors.purple),
            ),
            title: const Text('1. Container, Padding y ZiseBox', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: const Text('Cajas, Bordes y Espacios', style: TextStyle(fontSize: 13)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {

            },
          ),
          const Divider(),
          // segundo  ítem: Column y Row
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.star, color: Colors.purple),
            ),
            title: const Text('2. Column y Row', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: const Text('Alineación Vertical y Horizontal', style: TextStyle(fontSize: 13)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColumnRowScreen()),
              );
            },
          ),
          const Divider(),
          // tercer ítem: Elementos UI
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.star, color: Colors.purple),
            ),
            title: const Text('3. Elementos UI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: const Text('Text, Icon, Button', style: TextStyle(fontSize: 13)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ElementosUiScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}
