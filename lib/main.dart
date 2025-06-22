import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/pages/home/data_management/management_page.dart';
import 'package:ppjournal/presentation/pages/home/port_inside/add_journal/add_journal_page.dart';
import 'package:ppjournal/presentation/pages/home/port_inside/add_journal/note_journal_page.dart';
import '../../presentation/pages/home/home_page.dart';
import 'presentation/pages/home/port_inside/index.dart';
import '../../presentation/pages/home/create_port_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
          // Add more routes here as needed
          case '/port-inside-page':
            return MaterialPageRoute(builder: (context) => PortInsidePage());
          case '/create-port-page':
            return MaterialPageRoute(builder: (context) => CreatePortPage());
          case '/add-journal-page':
            return MaterialPageRoute(builder: (context) => AddJournalPage(), settings: settings);
          case '/note-journal-page':
          return  MaterialPageRoute(builder: (context) => NoteJournalPage(), settings: settings);
          case '/management-page':
            return MaterialPageRoute(builder: (context) => ManagementPage(), settings: settings);
          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('Page not found')),
              ),
            );
        }
      },
    );
  }
}

