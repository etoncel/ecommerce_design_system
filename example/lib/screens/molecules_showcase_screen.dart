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
            _buildSectionTitle('CategoryItem'),
            _buildCategoryItems(),
            _buildSectionTitle('QuantitySelector'),
            _buildQuantitySelector(),
          ],
        ),
      ),
    );
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
          ProductRating(rating: 3.0, color: Colors.grey),
          SizedBox(height: 8),
          ProductRating(rating: 5.0, iconSize: 20.0, fontSize: 16.0),
        ],
      ),
    );
  }

  Widget _buildCategoryItems() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CategoryItem(
            imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Cat1',
            categoryName: 'Category 1',
            onTap: () {
              // ignore: avoid_print
              print('Category 1 tapped!');
            },
          ),
          AppSpacing.horizontalM,
          CategoryItem(
            imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Cat2',
            categoryName: 'Category 2',
            onTap: () {
              // ignore: avoid_print
              print('Category 2 tapped!');
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
}
