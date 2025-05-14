import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('10:20', style: TextStyle(color: Colors.black)),
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
            // Título "Home Page" centrado con ícono + a la derecha
            Stack(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Home Page',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.grey, size: 24),
                    onPressed: () {
                      // Acción al presionar el +
                    },
                  ),
                ),
              ],
            ),

            // Imagen de la tarjeta
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cardDetail');
              },
              child: Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/card1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Título "Last Transactions" en gris
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Last Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Lista de transacciones
            Column(
              children: [
                _buildTransactionItem(
                    'Shopping', '-1000us', Icons.arrow_downward, Colors.red),
                const SizedBox(height: 8),
                _buildTransactionItem(
                    'Salary', '+1000us', Icons.arrow_upward, Colors.green),
                const SizedBox(height: 8),
                _buildTransactionItem(
                    'Receive', '+200us', Icons.arrow_upward, Colors.green),
              ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addCard');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String amount, IconData icon, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
