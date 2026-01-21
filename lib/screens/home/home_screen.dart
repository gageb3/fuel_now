import 'package:flutter/material.dart';
import '../checkout/checkout_screen.dart';

// Stateful because: Fuel type and gallons change, price recalculates
// Flutter creates _HomeScreenState and calls build()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -----------------------------
  // STATE
  // -----------------------------

  // App logic, business rules, not UI (derived from this data)
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
            const Text(
              'Fuel Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Changes fuel type
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

            const Text(
              'Gallons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Changes # of gallons
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

            Text(
              'Estimated Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Keeps HomeScreen alive, pushes CheckoutScreen on top
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                        fuelType: selectedFuelType,
                        gallons: gallons,
                        totalPrice: totalPrice,
                      ),
                    ),
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
