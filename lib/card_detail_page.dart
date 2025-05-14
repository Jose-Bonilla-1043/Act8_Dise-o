import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '10:21',
              style: const TextStyle(color: Colors.black),
            ),
            const Spacer(),
            const Icon(Icons.signal_cellular_alt,
                size: 18, color: Colors.black),
            const SizedBox(width: 8),
            const Icon(Icons.wifi, size: 18, color: Colors.black),
            const SizedBox(width: 8),
            const Icon(Icons.battery_full, size: 18, color: Colors.black),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila con título e iconos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.grey), // Icono < gris
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Card View',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete,
                      color: Colors.grey), // Icono eliminar gris
                  onPressed: () {
                    // Acción para eliminar la tarjeta
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Imagen de la tarjeta
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/card1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
