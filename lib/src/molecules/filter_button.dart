import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A filter button component for mobile layout that shows filter state
/// and provides access to category filters through a modal.
///
/// This widget displays different states:
/// - Default state: "Filter" text with filter icon
/// - Active state: Selected category name with close icon
class FilterButton extends StatefulWidget {
  /// The currently selected filter category name, null if no filter selected
  final String? selectedFilter;

  /// Callback function called when the button is tapped
  final VoidCallback onTap;

  /// Whether there is an active filter applied
  final bool hasActiveFilter;

  /// Optional semantic label for accessibility
  final String? semanticLabel;

  /// Creates a FilterButton widget
  const FilterButton({
    super.key,
    required this.onTap,
    this.selectedFilter,
    this.hasActiveFilter = false,
    this.semanticLabel,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(focusListener);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(focusListener);
  }

  void focusListener() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.hasActiveFilter && widget.selectedFilter != null;
    final displayText = isActive ? widget.selectedFilter! : 'Filter';
    final iconData = isActive ? AppIcons.close : AppIcons.filter;

    // Generate semantic label based on state
    final semanticLabel =
        widget.semanticLabel ??
        (isActive
            ? 'Clear filter: ${widget.selectedFilter}'
            : 'Open category filters');

    return Semantics(
      label: semanticLabel,
      button: true,
      child: InkWell(
        excludeFromSemantics: true,
        focusNode: _focusNode,
        onTap: () {
          _focusNode.requestFocus();
          widget.onTap();
        },
        autofocus: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.spaceM,
            vertical: AppSpacing.spaceS,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: AppSpacing.spaceM,
            vertical: AppSpacing.spaceXs,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isFocused
                  ? AppColors.primary
                  : (isActive ? AppColors.primary : AppColors.textLight),
              width: _isFocused ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.spaceS),
            color: isActive ? AppColors.primary : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: displayText,
                style: isActive
                    ? AppTextStyles.caption.copyWith(color: AppColors.white)
                    : AppTextStyles.caption,
              ),
              SizedBox(width: AppSpacing.spaceXs),
              AppIcon(
                iconData: iconData,
                size: AppSizes.sS,
                color: isActive ? AppColors.primary : AppColors.textDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
