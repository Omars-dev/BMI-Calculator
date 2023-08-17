import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'unit/history_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  void loadHistory() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('history')) {
      final historyString = _prefs.getString('history')!;
      setState(() {
        history = historyString.split(';').map((value) => double.parse(value)).toList();
      });
    }
  }


  void saveHistory() {
    final historyString = history.join(';');
    _prefs.setString('history', historyString);
  }

  void clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('history');
    setState(() {
      history.clear();
    });
  }


  double feetValue = 0;
  double cmValue = 0;
  List<double> history = [];

  void convertFeetToCm(double feet) {
    setState(() {
      feetValue = feet;
      cmValue = feet * 30.48;
      history.add(cmValue);
      saveHistory(); // Call saveHistory here
    });
  }


  void navigateToHistoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(history: history, prefs: _prefs),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: kActiveCardColor,
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    convertFeetToCm(double.parse(value));
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Height in Feet',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kGreenTextColor), // Change this color
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: kGreenTextColor),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kGreenTextColor), // Change this color
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Converted Value: $cmValue cm'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: kInactiveCardColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: navigateToHistoryPage,
                    style: ElevatedButton.styleFrom(
                      primary: kGreenTextColor,
                    ),
                    child: const Text('View History', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                          Text('Conversion ${index + 1}: ${history[index]} cm'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
