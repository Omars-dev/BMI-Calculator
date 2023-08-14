import 'package:flutter/material.dart';

class SavedBmiData extends StatelessWidget {
  const SavedBmiData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved BMI Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('Gender'),
              ),
              DataColumn(
                label: Text('Height'),
              ),
              DataColumn(
                label: Text('Weight'),
              ),
              DataColumn(
                label: Text('Age'),
              ),
              DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  const DataCell(
                    Text('Male'),
                  ),
                  const DataCell(
                    Text('166cm'),
                  ),
                  const DataCell(
                    Text('67'),
                  ),
                  const DataCell(
                    Text('26'),
                  ),
                  DataCell(
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text('Male'),
                  ),
                  const DataCell(
                    Text('166cm'),
                  ),
                  const DataCell(
                    Text('67'),
                  ),
                  const DataCell(
                    Text('26'),
                  ),
                  DataCell(
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text('Male'),
                  ),
                  const DataCell(
                    Text('166cm'),
                  ),
                  const DataCell(
                    Text('67'),
                  ),
                  const DataCell(
                    Text('26'),
                  ),
                  DataCell(
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text('Male'),
                  ),
                  const DataCell(
                    Text('166cm'),
                  ),
                  const DataCell(
                    Text('67'),
                  ),
                  const DataCell(
                    Text('26'),
                  ),
                  DataCell(
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text('Male'),
                  ),
                  const DataCell(
                    Text('166cm'),
                  ),
                  const DataCell(
                    Text('67'),
                  ),
                  const DataCell(
                    Text('26'),
                  ),
                  DataCell(
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
