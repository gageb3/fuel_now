import 'package:flutter/material.dart';
import '../checkout/checkout_screen.dart';
import '../subscriptions/subscription_screen.dart';
import '../profile/profile_screen.dart'; // We'll create this next
import '../subscriptions/plan_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -----------------------------
  // STATE
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
  double get totalPrice => gallons * fuelPrices[selectedFuelType]!;

  // -----------------------------
  // UI
  // -----------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FuelNow')),

      // --- HAMBURGER MENU / DRAWER ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              child: Text(
                'FuelNow Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_gas_station),
              title: const Text('Subscriptions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SubscriptionScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // --- MAIN BODY CONTENT ---
      body: Center(
        child: SingleChildScrollView(
          // Ensures content scrolls if screen is small
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Full width buttons/dropdowns
              children: [
                // --- Fuel Type ---
                const Text(
                  'Fuel Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedFuelType,
                  isExpanded: true,
                  items: fuelPrices.keys
                      .map(
                        (fuel) =>
                            DropdownMenuItem(value: fuel, child: Text(fuel)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFuelType = value!;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // --- Gallons ---
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

                const SizedBox(height: 32),

                // --- Subscriptions Section ---
                const Center(
                  child: Text(
                    'FuelNow Subscriptions',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PlanDetailsScreen(
                          planName: 'Basic Plan',
                          price: 19.99,
                          description:
                              'Includes 1 fuel delivery per week with standard support.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Basic Plan'),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PlanDetailsScreen(
                          planName: 'Standard Plan',
                          price: 39.99,
                          description:
                              'Up to 3 deliveries per week with priority scheduling.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Standard Plan'),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PlanDetailsScreen(
                          planName: 'Premium Plan',
                          price: 69.99,
                          description:
                              'Unlimited deliveries with 24/7 priority support.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Premium Plan'),
                ),

                const SizedBox(height: 24),

                // --- Estimated Total ---
                Text(
                  'Estimated Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // --- Continue Button ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
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
        ),
      ),
    );
  }
}
