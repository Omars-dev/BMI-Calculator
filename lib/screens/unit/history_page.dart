import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  final List<double> history;
  final SharedPreferences prefs;

  HistoryPage({required this.history, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Conversion ${index + 1}: ${history[index]} cm'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear history and remove from SharedPreferences
          prefs.remove('history');
          Navigator.pop(context);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

