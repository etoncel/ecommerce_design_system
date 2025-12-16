// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

class OrganismsShowcaseScreen extends StatelessWidget {
  const OrganismsShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Organisms Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ProductCard'),
            _buildProductCards(),
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

  Widget _buildProductCards() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: AppSpacing.spaceM,
        runSpacing: AppSpacing.spaceM,
        children: [
          ProductCard(
            imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Product1',
            productName: 'Product Name 1 with a long title',
            productPrice: '\$19.99',
            rating: 4.5,
            onTap: () {
              // ignore: avoid_print
              print('Product 1 tapped!');
            },
          ),
          ProductCard(
            imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Product2',
            productName: 'Product Name 2',
            productPrice: '\$29.50',
            rating: 3.8,
            onTap: () {
              // ignore: avoid_print
              print('Product 2 tapped!');
            },
          ),
          ProductCard(
            imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Product3',
            productName: 'Product Name 3',
            productPrice: '\$9.00',
            onTap: () {
              // ignore: avoid_print
              print('Product 3 tapped!');
            },
          ),
        ],
      ),
    );
  }
}
