import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/pages/home/port_inside/dashboard_page.dart';
import 'package:ppjournal/presentation/pages/home/port_inside/journal_page.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/presentation/widgets/navigation_bar_custom.dart';

class PortInsidePage extends StatefulWidget {
  const PortInsidePage({super.key});

  @override
  State<PortInsidePage> createState() => _PortInsidePageState();
}

class _PortInsidePageState extends State<PortInsidePage> {
  int currentIndex = 0; // Default to the second tab (Journal)
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    currentIndex = 0; // Default to the second tab (Journal)
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Journal',
        shouldShowLeading: true,
        actions: currentIndex == 1
        ? [
            IconButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            // Implement functionality here
            Navigator.pushNamed(context, '/add-journal-page');
          },
            )
          ]
        : null,
      ),
      bottomNavigationBar: NavigationBarCustom(currentIndex: currentIndex, onTap: onTap),
      body: currentIndex == 0 ? DashboardPage() : JournalPage(), // Change to JournalPage when index is 1
    );
  }
}