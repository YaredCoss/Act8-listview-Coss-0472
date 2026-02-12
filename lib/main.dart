import 'package:flutter/material.dart';

void main() => runApp(AppFlashcards());

class AppFlashcards extends StatelessWidget {
  const AppFlashcards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flashcards",
      home: Mazos(),
    );
  }
} // fin clase AppFlashcards

class Mazos extends StatelessWidget {
  const Mazos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
    'Flashcards Coss 6J',
    style: TextStyle(color: Colors.white),
  ),
  centerTitle: true,
  backgroundColor: Colors.blue,
  leading: const Icon(
    Icons.camera_alt,
    color: Color.fromARGB(255, 131, 49, 49),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.favorite, color: Color.fromARGB(255, 150, 7, 7)),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
      onPressed: () {},
    ),
  ],
),

body: ListView(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  children: [
    _crearElemento(
      context,
      icon: Icons.person,
      color: Colors.amber,
      titulo: 'Mi perfil ',
      subtitulo: 'Gestiona tu perfil',
    ),
    _crearElemento(
      context,
      icon: Icons.deck,
      color: Colors.blue,
      titulo: 'Mazos',
      subtitulo: 'Revisa tus mazos',
    ),
    _crearElemento(
      context,
      icon: Icons.create,
      color: Colors.redAccent,
      titulo: 'Crear mazo',
      subtitulo: 'Crea tu mazo',
    ),
    _crearElemento(
      context,
      icon: Icons.settings,
      color: Colors.teal,
      titulo: 'Ajustes',
      subtitulo: 'Personaliza tu experiencia',
    ),
  ],
),

    );
  }
} // fin clase Mazos

Widget _crearElemento(BuildContext context, {
  required IconData icon, 
  required Color color, 
  required String titulo, 
  required String subtitulo
}) {
  return Card( // Usamos Card para darle relieve y que sea más atractivo
    elevation: 2,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitulo),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Esto hace que el elemento sea funcional mostrando un aviso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Abriendo: $titulo'),
            duration: const Duration(seconds: 1),
            backgroundColor: color,
          ),
        );
      },
    ),
  );
}