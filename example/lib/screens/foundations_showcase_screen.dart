// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

class FoundationsShowcaseScreen extends StatelessWidget {
  const FoundationsShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foundations Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('AppColors'),
            _buildAppColors(),
            _buildSectionTitle('AppTextStyles'),
            _buildAppTextStyles(),
            _buildSectionTitle('AppSpacing'),
            _buildAppSpacing(),
            _buildSectionTitle('AppSizes'),
            _buildAppSizes(),
            _buildSectionTitle('AppIcons'),
            _buildAppIcons(),
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

  Widget _buildAppColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColorItem('Primary', AppColors.primary),
        _buildColorItem('Secondary', AppColors.secondary),
        _buildColorItem('Accent', AppColors.accent),
        _buildColorItem('Background', AppColors.background),
        _buildColorItem('Text Dark', AppColors.textDark),
        _buildColorItem('Text Light', AppColors.textLight),
        _buildColorItem('White', AppColors.white),
        _buildColorItem('Black', AppColors.black),
      ],
    );
  }

  Widget _buildColorItem(String name, Color colorValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: colorValue,
            margin: const EdgeInsets.only(right: 16.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '#${colorValue.value.toRadixString(16).toUpperCase().substring(2)}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppTextStyles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextStyleItem('Headline 1', AppTextStyles.headline1),
        _buildTextStyleItem('Headline 2', AppTextStyles.headline2),
        _buildTextStyleItem('Body', AppTextStyles.body),
        _buildTextStyleItem('Caption', AppTextStyles.caption),
        _buildTextStyleItem('Button', AppTextStyles.button),
      ],
    );
  }

  Widget _buildTextStyleItem(String name, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            'Ejemplo de texto con este estilo',
            style: style,
          ),
          Text(
            'Size: ${style.fontSize?.toStringAsFixed(1)}, Weight: ${style.fontWeight}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildAppSpacing() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpacingItem('Space XXS', AppSpacing.spaceXxs),
        _buildSpacingItem('Space XS', AppSpacing.spaceXs),
        _buildSpacingItem('Space S', AppSpacing.spaceS),
        _buildSpacingItem('Space M', AppSpacing.spaceM),
        _buildSpacingItem('Space L', AppSpacing.spaceL),
        AppSpacing.verticalS,
        const Text(
          'Visualización de Espaciados (horizontal y vertical):',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        AppSpacing.verticalXs,
        Row(
          children: [
            Container(width: 50, height: 20, color: Colors.blueGrey),
            AppSpacing.horizontalXxs,
            Container(width: 50, height: 20, color: Colors.blueGrey),
            AppSpacing.horizontalS,
            Container(width: 50, height: 20, color: Colors.blueGrey),
          ],
        ),
        AppSpacing.verticalXs,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 50, height: 20, color: Colors.blueGrey),
            AppSpacing.verticalXxs,
            Container(width: 50, height: 20, color: Colors.blueGrey),
            AppSpacing.verticalS,
            Container(width: 50, height: 20, color: Colors.blueGrey),
          ],
        ),
      ],
    );
  }

  Widget _buildSpacingItem(String name, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$name: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildAppSizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSizeItem('Border Radius Small', AppSizes.sXS),
        _buildSizeItem('Extra Extra Small', AppSizes.sXXS),
        _buildSizeItem('Extra Small', AppSizes.sXS),
        _buildSizeItem('Small', AppSizes.sS),
        _buildSizeItem('Medium', AppSizes.sM),
        _buildSizeItem('Large', AppSizes.sL),
        AppSpacing.verticalS,
        const Text(
          'Visualización de AppSizes:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        AppSpacing.verticalXs,
        Container(
          width: AppSizes.sL * 2, // Example usage
          height: AppSizes.sM,
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppSizes.sXS),
          ),
          alignment: Alignment.center,
          child: Text('Ancho: ${AppSizes.sL * 2}, Alto: ${AppSizes.sM}'),
        ),
      ],
    );
  }

  Widget _buildSizeItem(String name, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$name: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildAppIcons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconItem('Search Icon', AppIcons.search),
        _buildIconItem('Shopping Bag Icon', AppIcons.shoppingBag),
        _buildIconItem('Heart Outlined Icon', AppIcons.heartOutlined),
        _buildIconItem('Menu Icon', AppIcons.menu),
        _buildIconItem('Arrow Back Icon', AppIcons.arrowBack),
        _buildIconItem('Star Icon', AppIcons.star),
        _buildIconItem('Plus Icon', AppIcons.plus),
        _buildIconItem('Minus Icon', AppIcons.minus),
      ],
    );
  }

  Widget _buildIconItem(String name, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(iconData, size: 24.0),
          AppSpacing.horizontalS,
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}