import 'package:flutter/material.dart';
import '../subscriptions/plan_details_screen.dart';
import '/data/app_data.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscriptions')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Current Plan Card ---
              Card(
                color: Colors.grey[900],
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Subscription',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Current Plan: ${AppData.instance.currentPlan}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Header ---
              const Text(
                'Choose a Plan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // --- Subscription Cards ---
              _subscriptionCard(
                context: context,
                title: 'Basic',
                description: 'Up to 20 gallons per month',
                price: 49,
              ),
              const SizedBox(height: 16),
              _subscriptionCard(
                context: context,
                title: 'Standard',
                description: 'Up to 50 gallons per month',
                price: 99,
              ),
              const SizedBox(height: 16),
              _subscriptionCard(
                context: context,
                title: 'Premium',
                description: 'Unlimited fuel delivery',
                price: 149,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------
// Subscription Card Widget
// --------------------------------
Widget _subscriptionCard({
  required BuildContext context,
  required String title,
  required String description,
  required double price,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            '\$${price.toStringAsFixed(0)} / month',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to PlanDetailsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlanDetailsScreen(
                      planName: title,
                      price: price,
                      description: description,
                    ),
                  ),
                );
              },
              child: const Text('Select Plan'),
            ),
          ),
        ],
      ),
    ),
  );
}
