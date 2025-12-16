import 'package:example/screens/atoms_showcase_screen.dart';
import 'package:example/screens/foundations_showcase_screen.dart';
import 'package:example/screens/molecules_showcase_screen.dart'; // New import
import 'package:flutter/material.dart';

class ShowcaseHomePage extends StatefulWidget {
  const ShowcaseHomePage({super.key});

  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

class _ShowcaseHomePageState extends State<ShowcaseHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    ); // 5 tabs for Foundations, Atoms, Molecules, Organisms, Templates
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Showroom'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Foundations'),
            Tab(text: 'Atoms'),
            Tab(text: 'Molecules'),
            Tab(text: 'Organisms'),
            Tab(text: 'Templates'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FoundationsShowcaseScreen(),
          AtomsShowcaseScreen(),
          MoleculesShowcaseScreen(), // Replaced placeholder
          Center(
            child: Text('Organisms Showcase (Coming Soon)'),
          ), // Placeholder
          Center(
            child: Text('Templates Showcase (Coming Soon)'),
          ), // Placeholder
        ],
      ),
    );
  }
}
