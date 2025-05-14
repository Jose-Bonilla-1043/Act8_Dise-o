import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Elimina el banner de debug
    home: AddCardPage(),
  ));
}

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _bankNameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('10:21', style: TextStyle(color: Colors.black)),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          children: [
            // Botón de retroceso
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 4),

            // Título "Add Card"
            const Text(
              'Add Card',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            // Formulario compacto
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField('Card name', _cardNameController),
                  const SizedBox(height: 8),
                  _buildTextField('Card Number', _cardNumberController),
                  const SizedBox(height: 8),
                  _buildTextField('Bank Name', _bankNameController),
                  const SizedBox(height: 8),
                  _buildTextField('Available Balance', _balanceController,
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 8),
                  _buildCurrencyField(),
                  const SizedBox(height: 16),

                  // Botón "Add" alineado con los campos
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: const Text('Add'),
                    ),
                  ),
                ],
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

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildCurrencyField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Currency',
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      readOnly: true, // Hace que el campo sea de solo lectura
      onTap: () {
        // Aquí podrías agregar la lógica para seleccionar moneda si es necesario
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card added successfully')),
      );
      Navigator.pop(context);
    }
  }
}
