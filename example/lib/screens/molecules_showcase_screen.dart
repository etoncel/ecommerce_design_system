import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

class MoleculesShowcaseScreen extends StatelessWidget {
  const MoleculesShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Molecules Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('AppSearchBar'),
            _buildAppSearchBar(),
            _buildSectionTitle('ProductRating'),
            _buildProductRating(),
            _buildSectionTitle('SingleListItem'),
            _buildSingleListItems(),
            _buildSectionTitle('QuantitySelector'),
            _buildQuantitySelector(),
            _buildSectionTitle('QuantityIndicator'), // Nuevo
            _buildQuantityIndicator(), // Nuevo
          ],
        ),
      ),
    );
  }

  // Nuevo método para mostrar QuantityIndicator
  Widget _buildQuantityIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuantityIndicator(name: 'Zapatos', quantity: 1200),
          SizedBox(height: 8),
          QuantityIndicator(name: 'Electrodomésticos', quantity: 320),
          SizedBox(height: 8),
          QuantityIndicator(name: 'Frutas', quantity: 4333),
        ],
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildAppSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: AppSearchBar(
      hintText: 'Buscar productos...',
      onChanged: (value) {
        // ignore: avoid_print
        print('Search text changed: $value');
      },
      onSubmitted: (value) {
        // ignore: avoid_print
        print('Search text submitted: $value');
      },
    ),
  );
}

Widget _buildProductRating() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductRating(rating: 4.5),
        SizedBox(height: 8),
        ProductRating(rating: 3.0),
        SizedBox(height: 8),
        ProductRating(rating: 5.0, iconSize: 20.0, fontSize: 16.0),
      ],
    ),
  );
}

Widget _buildSingleListItems() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        SingleListItem(
          imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Item1',
          itemName: 'Item 1',
          onTap: () {
            // ignore: avoid_print
            print('Item 1 tapped!');
          },
        ),
        AppSpacing.horizontalM,
        SingleListItem(
          imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Item2',
          itemName: 'Item 2',
          onTap: () {
            // ignore: avoid_print
            print('Item 2 tapped!');
          },
        ),
      ],
    ),
  );
}

Widget _buildQuantitySelector() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: QuantitySelector(
      initialQuantity: 1,
      minQuantity: 1,
      maxQuantity: 10,
      onChanged: (quantity) {
        // ignore: avoid_print
        print('Selected quantity: $quantity');
      },
    ),
  );
}
