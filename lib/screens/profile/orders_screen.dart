import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  // Mock order data (later replaced by backend)
  final List<Map<String, dynamic>> orders = const [
    {'date': 'Jan 15, 2026', 'fuel': 'Regular', 'gallons': 12, 'total': 41.88},
    {'date': 'Jan 03, 2026', 'fuel': 'Premium', 'gallons': 8, 'total': 31.92},
    {'date': 'Dec 22, 2025', 'fuel': 'Diesel', 'gallons': 15, 'total': 56.85},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['date'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text('Fuel: ${order['fuel']}'),
                  Text('Gallons: ${order['gallons']}'),
                  Text('Total: \$${order['total'].toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
