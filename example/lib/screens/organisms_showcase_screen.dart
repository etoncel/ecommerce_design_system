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
  String? _selectedFilter;

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
            _buildSectionTitle('SingleHorizontalList'),
            _buildSingleHorizontalList(),
            const SizedBox(height: AppSpacing.spaceL),
            _buildSectionTitle('ProductCard (Individual)'),
            _buildProductCards(),
            const SizedBox(height: AppSpacing.spaceL),
            _buildSectionTitle('QuantityIndicatorList'),
            _buildQuantityIndicatorList(),
            const SizedBox(height: AppSpacing.spaceL),
            _buildSectionTitle('FilterModal'),
            _buildFilterModal(),
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
          title: 'Product 1',
          subtitle: '\$19.99',
          rating: 4.5,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=P2',
          title: 'Product 2',
          subtitle: '\$29.50',
          rating: 3.8,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=P3',
          title: 'Product 3',
          subtitle: '\$9.00',
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/FFFF00/000000?text=P4',
          title: 'Product 4',
          subtitle: '\$12.49',
          rating: 5.0,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSingleHorizontalList() {
    final items = [
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/FFC107/000000?text=C1',
        itemName: 'Item 1',
        onTap: () => debugPrint('Tapped Item 1'),
      ),
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/4CAF50/FFFFFF?text=C2',
        itemName: 'Item 2',
        onTap: () => debugPrint('Tapped Item 2'),
      ),
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/2196F3/FFFFFF?text=C3',
        itemName: 'Item 3',
        onTap: () => debugPrint('Tapped Item 3'),
      ),
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/E91E63/FFFFFF?text=C4',
        itemName: 'Item 4',
        onTap: () => debugPrint('Tapped Item 4'),
      ),
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/9C27B0/FFFFFF?text=C5',
        itemName: 'Item 5',
        onTap: () => debugPrint('Tapped Item 5'),
      ),
      SingleListItemData(
        imageUrl: 'https://via.placeholder.com/150/F44336/FFFFFF?text=C6',
        itemName: 'Item 6',
        onTap: () => debugPrint('Tapped Item 6'),
      ),
    ];

    return SingleHorizontalList(title: 'Browse Items', items: items);
  }

  Widget _buildProductCards() {
    return Wrap(
      spacing: AppSpacing.spaceM,
      runSpacing: AppSpacing.spaceM,
      alignment: WrapAlignment.center,
      children: [
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Prod1',
          title: 'Product Name 1 with a long title',
          subtitle: '\$19.99',
          rating: 4.5,
          onTap: () {},
        ),
        ProductCard(
          imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Prod2',
          title: 'Product Name 2',
          subtitle: '\$29.50',
          rating: 3.8,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildQuantityIndicatorList() {
    return const QuantityIndicatorList(
      title: 'Categories',
      indicators: [
        QuantityIndicator(name: 'Zapatos', quantity: 1200),
        QuantityIndicator(name: 'Electrodomésticos', quantity: 320),
        QuantityIndicator(name: 'Frutas', quantity: 4333),
        QuantityIndicator(name: 'Verduras', quantity: 250),
      ],
    );
  }

  Widget _buildFilterModal() {
    final indicators = [
      const QuantityIndicator(name: 'Electronics', quantity: 150),
      const QuantityIndicator(name: 'Clothing', quantity: 320),
      const QuantityIndicator(name: 'Books', quantity: 89),
      const QuantityIndicator(name: 'Home & Garden', quantity: 245),
      const QuantityIndicator(name: 'Sports', quantity: 67),
      const QuantityIndicator(name: 'Toys', quantity: 123),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show current filter state
        if (_selectedFilter != null)
          Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.spaceM),
            padding: const EdgeInsets.all(AppSpacing.spaceS),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
              border: Border.all(color: AppColors.primary),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIcon(
                  iconData: AppIcons.filter,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: AppSpacing.spaceXs),
                AppText(
                  text: 'Active filter: $_selectedFilter',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

        // Button to open modal
        ElevatedButton.icon(
          onPressed: () => _showFilterModal(indicators),
          icon: const AppIcon(
            iconData: AppIcons.filter,
            size: 16,
            color: AppColors.background,
          ),
          label: AppText(
            text: _selectedFilter ?? 'Open Filter Modal',
            style: AppTextStyles.body.copyWith(
              color: AppColors.background,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spaceM,
              vertical: AppSpacing.spaceS,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.spaceM),

        // Instructions
        Container(
          padding: const EdgeInsets.all(AppSpacing.spaceS),
          decoration: BoxDecoration(
            color: AppColors.textLight.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'FilterModal Features:',
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              AppText(
                text: '• Bottom sheet modal with rounded corners',
                style: AppTextStyles.caption,
              ),
              AppText(
                text: '• Drag handle and close button',
                style: AppTextStyles.caption,
              ),
              AppText(
                text: '• Clear filter option when active',
                style: AppTextStyles.caption,
              ),
              AppText(
                text: '• Dismissible by tap outside, drag, or escape key',
                style: AppTextStyles.caption,
              ),
              AppText(
                text: '• Full accessibility support with focus management',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showFilterModal(List<QuantityIndicator> indicators) {
    FilterModal.show(
      context: context,
      indicators: indicators,
      selectedFilter: _selectedFilter,
      onIndicatorSelected: (index) {
        setState(() {
          _selectedFilter = indicators[index].name;
        });
        debugPrint('Selected filter: ${indicators[index].name}');
      },
      onFilterUnselected: () {
        setState(() {
          _selectedFilter = null;
        });
        debugPrint('Filter cleared');
      },
    );
  }
}
