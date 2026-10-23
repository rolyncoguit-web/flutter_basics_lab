import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const CafeApp());
}

// Menu item model.
class CafeItem {
  const CafeItem(this.name, this.price, this.icon, {this.bestSeller = false});

  final String name;
  final double price;
  final IconData icon;
  final bool bestSeller;
}

// Menu data.
const List<CafeItem> menu = [
  CafeItem('Iced Coffee', 85, Icons.local_cafe, bestSeller: true),
  CafeItem('Hot Chocolate', 75, Icons.coffee),
  CafeItem('Fruit Shake', 90, Icons.local_drink, bestSeller: true),
  CafeItem('Cheeseburger', 120, Icons.lunch_dining),
  CafeItem('Fries', 60, Icons.fastfood),
  CafeItem('Ensaymada', 45, Icons.bakery_dining),

  // Two additional items for the lab task.
  CafeItem('Ice Cream', 55, Icons.icecream),
  CafeItem('Chocolate Cake', 95, Icons.cake, bestSeller: true),
];

const List<String> categories = [
  'All',
  'Drinks',
  'Snacks',
  'Meals',
  'Desserts',
];

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 4',
      debugShowCheckedModeBanner: false,
      theme: buildStudentTheme(),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('Activity 4 - $studentName')),
      body: Column(
        children: [
          // Banner with overlapping elements.
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  color: colors.primaryContainer,
                ),
                Positioned(
                  right: -10,
                  bottom: -20,
                  child: Icon(
                    Icons.local_cafe,
                    size: 160,
                    color: colors.primary.withAlpha(60),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    'Campus Café',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'OPEN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Horizontal category list.
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return Chip(label: Text(categories[index]));
              },
            ),
          ),

          // Scrollable two-column menu.
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return MenuCard(item: menu[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final CafeItem item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item.icon, size: 48, color: colors.primary),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('₱${item.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),

          // Display the badge only for best sellers.
          if (item.bestSeller)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Best seller',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
