import 'package:flutter/material.dart';

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
  String _selectedCurrency = 'USD';

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
        title: const Text('Add Card'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${TimeOfDay.now().hour}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Card name', _cardNameController),
              const SizedBox(height: 16),
              _buildTextField('Card Number', _cardNumberController,
                  isCardNumber: true),
              const SizedBox(height: 16),
              _buildTextField('Bank Name', _bankNameController),
              const SizedBox(height: 16),
              _buildTextField('Available Balance', _balanceController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                decoration: const InputDecoration(
                  labelText: 'Currency',
                  border: OutlineInputBorder(),
                ),
                items: ['USD', 'EUR', 'GBP', 'JPY', 'MXN']
                    .map((currency) => DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                  });
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isCardNumber = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: isCardNumber ? const Icon(Icons.credit_card) : null,
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card added successfully')),
      );
      Navigator.pop(context);
    }
  }
}
