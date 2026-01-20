import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -----------------------------
  // STATE (data that can change)
  // -----------------------------

  String selectedFuelType = 'Regular';
  double gallons = 10;

  final Map<String, double> fuelPrices = {
    'Regular': 3.49,
    'Premium': 3.99,
    'Diesel': 3.79,
  };

  // -----------------------------
  // LOGIC
  // -----------------------------

  double get totalPrice {
    return gallons * fuelPrices[selectedFuelType]!;
  }

  // -----------------------------
  // UI
  // -----------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Fuel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fuel Type
            const Text(
              'Fuel Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            DropdownButton<String>(
              value: selectedFuelType,
              isExpanded: true,
              items: fuelPrices.keys.map((fuel) {
                return DropdownMenuItem(value: fuel, child: Text(fuel));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFuelType = value!;
                });
              },
            ),

            const SizedBox(height: 24),

            // Gallons
            const Text(
              'Gallons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Slider(
              value: gallons,
              min: 1,
              max: 50,
              divisions: 49,
              label: gallons.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  gallons = value;
                });
              },
            ),

            Text(
              '${gallons.toStringAsFixed(0)} gallons',
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            // Price + Continue
            Text(
              'Estimated Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Later: navigate to checkout
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order submitted (mock)')),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
