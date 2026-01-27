import 'package:flutter/material.dart';
import '/data/app_data.dart';

// Stateless because it doesn't change data, only displays data passed into it
// Once built, nothing here needs to update
class CheckoutScreen extends StatelessWidget {
  // -----------------------------
  // DATA PASSED INTO THIS SCREEN
  // -----------------------------

  // These values should never change on this screen
  // Values come from nav.push in HomeScreen
  final String fuelType;
  final double gallons;
  final double totalPrice;

  // Constructor requires the order data, assigns it to final fields, prevents screen from being created without data.
  // Required because checkout cannot function without this info
  const CheckoutScreen({
    super.key,
    required this.fuelType,
    required this.gallons,
    required this.totalPrice,
  });

  // -----------------------------
  // UI
  // -----------------------------

  // Where UI is described
  @override
  Widget build(BuildContext context) {
    // Scaffold provides appbar, body, screen layout structure etc
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Stacks widgets vertically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            // Helper Widgets, pass label + value, keeps UI clean
            _summaryRow('Fuel Type', fuelType),
            _summaryRow('Gallons', gallons.toStringAsFixed(0)),
            _summaryRow('Total Price', '\$${totalPrice.toStringAsFixed(2)}'),

            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                final address = AppData.instance;
                if (address.hasAddress) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery Address:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${address.street}, ${address.city}, ${address.state} ${address.zip}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Pushes a modal route, show confirmation UI
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      // Simulates successful API response, user feedback etc
                      return AlertDialog(
                        title: const Text('Order Confirmed'),
                        content: const Text(
                          'Your fuel delivery has been scheduled.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (fuelType == 'Basic' ||
                                  fuelType == 'Standard' ||
                                  fuelType == 'Premium') {
                                AppData.instance.currentPlan = fuelType;
                              }
                              ScaffoldMessenger.of(dialogContext).showSnackBar(
                                const SnackBar(
                                  content: Text('Order successful!'),
                                ),
                              );
                              Navigator.pop(context); // close dialog
                              Navigator.pop(context); // go back to home
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  // HELPER WIDGET
  // -----------------------------

  // Private helper widget, reduces repetition, improves readability, easier to update later.
  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
