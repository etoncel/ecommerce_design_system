// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

class OrganismsShowcaseScreen extends StatefulWidget {
  const OrganismsShowcaseScreen({super.key});

  @override
  State<OrganismsShowcaseScreen> createState() =>
      _OrganismsShowcaseScreenState();
}

class _OrganismsShowcaseScreenState extends State<OrganismsShowcaseScreen> {
  bool _showSearchBar = false;
  final _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Organisms',
        showSearchBar: _showSearchBar,
        searchController: _searchController,
        searchHintText: 'Search organisms...',
        onSearchChanged: (value) {
          debugPrint('Search query: $value');
        },
        actions: [
          IconButton(
            icon: AppIcon(
              iconData: _showSearchBar ? AppIcons.close : AppIcons.search,
            ),
            onPressed: () {
              setState(() {
                _showSearchBar = !_showSearchBar;
                if (!_showSearchBar) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.spaceS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('HorizontalProductList'),
            _buildHorizontalProductList(),
            const SizedBox(height: AppSpacing.spaceL),
            _buildSectionTitle('ProductCard (Individual)'),
            _buildProductCards(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceS),
      child: AppText(text: title, style: AppTextStyles.headline1),
    );
  }

  Widget _buildHorizontalProductList() {
    return HorizontalProductList(
      title: 'Featured Products',
      productCards: [
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=P1',
          productName: 'Product 1',
          productPrice: '\$19.99',
          rating: 4.5,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=P2',
          productName: 'Product 2',
          productPrice: '\$29.50',
          rating: 3.8,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=P3',
          productName: 'Product 3',
          productPrice: '\$9.00',
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/FFFF00/000000?text=P4',
          productName: 'Product 4',
          productPrice: '\$12.49',
          rating: 5.0,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildProductCards() {
    return Wrap(
      spacing: AppSpacing.spaceM,
      runSpacing: AppSpacing.spaceM,
      alignment: WrapAlignment.center,
      children: [
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Prod1',
          productName: 'Product Name 1 with a long title',
          productPrice: '\$19.99',
          rating: 4.5,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Prod2',
          productName: 'Product Name 2',
          productPrice: '\$29.50',
          rating: 3.8,
          onTap: () {},
        ),
      ],
    );
  }
}
