import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// A modal dialog component for mobile category filter selection.
///
/// This widget displays a bottom sheet modal containing category filters
/// using the QuantityIndicatorList component. It provides proper modal
/// behavior with dismissal handling and accessibility features.
class FilterModal extends StatelessWidget {
  /// List of quantity indicators to display in the modal
  final List<QuantityIndicator> indicators;

  /// Currently selected filter category name, null if no filter selected
  final String? selectedFilter;

  /// Callback function called when an indicator is selected
  /// Returns the index of the selected indicator
  final Function(int)? onIndicatorSelected;

  /// Callback function called when the filter should be cleared/unselected
  final VoidCallback? onFilterUnselected;

  /// Creates a FilterModal widget
  const FilterModal({
    super.key,
    required this.indicators,
    this.selectedFilter,
    this.onIndicatorSelected,
    this.onFilterUnselected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.spaceM),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar for drag indication
          _buildHandleBar(),

          // Modal header with title and close button
          _buildHeader(context),

          // Scrollable content with category list
          _buildContent(context),

          // Bottom padding for safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildHandleBar() {
    return Container(
      margin: EdgeInsets.only(top: AppSpacing.spaceS),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.textLight,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.spaceM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: 'Categories', style: AppTextStyles.headline1),
          Semantics(
            label: 'Close filter modal',
            button: true,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.all(AppSpacing.spaceXs),
                decoration: BoxDecoration(
                  color: AppColors.textLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
                ),
                child: const AppIcon(
                  iconData: AppIcons.close,
                  size: 20,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Clear filter option if there's an active filter
            if (selectedFilter != null && selectedFilter!.isNotEmpty)
              _buildClearFilterOption(context),

            // Category list
            QuantityIndicatorList(
              indicators: indicators,
              onIndicatorSelected: (index) {
                onIndicatorSelected?.call(index);
                Navigator.of(context).pop();
              },
            ),

            // Bottom spacing
            SizedBox(height: AppSpacing.spaceL),
          ],
        ),
      ),
    );
  }

  Widget _buildClearFilterOption(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Clear current filter: $selectedFilter',
          button: true,
          child: GestureDetector(
            onTap: () {
              onFilterUnselected?.call();
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.spaceS,
                horizontal: AppSpacing.spaceXs,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 1),
                borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
                color: AppColors.primary.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  const AppIcon(
                    iconData: AppIcons.close,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: AppSpacing.spaceXs),
                  AppText(
                    text: 'Clear filter: $selectedFilter',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.spaceM),
        Container(height: 1, color: AppColors.textLight.withOpacity(0.2)),
        SizedBox(height: AppSpacing.spaceM),
      ],
    );
  }

  /// Static method to show the FilterModal as a bottom sheet
  static Future<void> show({
    required BuildContext context,
    required List<QuantityIndicator> indicators,
    String? selectedFilter,
    Function(int)? onIndicatorSelected,
    VoidCallback? onFilterUnselected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (context) => FilterModal(
        indicators: indicators,
        selectedFilter: selectedFilter,
        onIndicatorSelected: onIndicatorSelected,
        onFilterUnselected: onFilterUnselected,
      ),
    );
  }
}
