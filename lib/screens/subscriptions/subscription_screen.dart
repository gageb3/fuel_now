import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscriptions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Choose a Plan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _subscriptionCard(
              title: 'Basic',
              description: 'Up to 20 gallons per month',
              price: '\$49 / month',
            ),

            const SizedBox(height: 16),
            _subscriptionCard(
              title: 'Standard',
              description: 'Up to 50 gallons per month',
              price: '\$99 / month',
            ),
            const SizedBox(height: 16),
            _subscriptionCard(
              title: 'Premium',
              description: 'Unlimited fuel delivery',
              price: '\$149 / month',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _subscriptionCard({
  required String title,
  required String description,
  required String price,
}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Text(description),

          const SizedBox(height: 12),

          Text(
            price,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Later
              },
              child: const Text('Select Plan'),
            ),
          ),
        ],
      ),
    ),
  );
}
