import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

class AtomsShowcaseScreen extends StatelessWidget {
  const AtomsShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atoms Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('AppButton'),
            _buildAppButtons(),
            _buildSectionTitle('AppText'),
            _buildAppTexts(context),
            _buildSectionTitle('AppIcon'),
            _buildAppIcons(),
            _buildSectionTitle('AppCircularImage'),
            _buildAppCircularImages(),
            _buildSectionTitle('AppTag'),
            _buildAppTags(),
            _buildSectionTitle('AppInput'),
            _buildAppInputs(),
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

  Widget _buildAppButtons() {
    return Column(
      children: [
        AppButton(onPressed: () {}, text: 'Primary Button', isPrimary: true),
        const SizedBox(height: 16),
        AppButton(onPressed: () {}, text: 'Secondary Button', isPrimary: false),
      ],
    );
  }

  Widget _buildAppTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: 'Headline 1 Example', style: AppTextStyles.headline1),
        const SizedBox(height: 8),
        AppText(text: 'Headline 2 Example', style: AppTextStyles.headline2),
        const SizedBox(height: 8),
        AppText(text: 'Body Text Example', style: AppTextStyles.body),
        const SizedBox(height: 8),
        AppText(text: 'Caption Text Example', style: AppTextStyles.caption),
        const SizedBox(height: 8),
        AppText(text: 'Button Text Example', style: AppTextStyles.button),
      ],
    );
  }

  Widget _buildAppIcons() {
    return const Row(
      children: [
        AppIcon(iconData: AppIcons.search),
        AppSpacing.horizontalM,
        AppIcon(iconData: AppIcons.heartOutlined, color: AppColors.primary),
        AppSpacing.horizontalM,
        AppIcon(iconData: AppIcons.plus, size: 30),
      ],
    );
  }

  Widget _buildAppCircularImages() {
    return const Row(
      children: [
        AppCircularImage(
            imageUrl:
                'https://via.placeholder.com/150/FF0000/FFFFFF?text=Image1'),
        AppSpacing.horizontalM,
        AppCircularImage(
            imageUrl:
                'https://via.placeholder.com/150/0000FF/FFFFFF?text=Image2',
            hasBorder: true),
      ],
    );
  }

  Widget _buildAppTags() {
    return const Row(
      children: [
        AppTag(text: 'New'),
        AppSpacing.horizontalM,
        AppTag(text: 'Sale', backgroundColor: AppColors.secondary),
      ],
    );
  }

  Widget _buildAppInputs() {
    return Column(
      children: [
        AppInput(
          labelText: 'Username',
          hintText: 'Enter your username',
        ),
        AppSpacing.verticalS,
        AppInput(
          labelText: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
        ),
      ],
    );
  }
}