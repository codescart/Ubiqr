import 'package:flutter/material.dart';

class DatePrint extends StatefulWidget {
  const DatePrint({Key? key}) : super(key: key);

  @override
  State<DatePrint> createState() => _DatePrintState();
}

class _DatePrintState extends State<DatePrint> {
  final TextEditingController _date = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("date"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextField(
            controller: _date,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month_outlined),
                labelText: "Select Date"),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101))
                  .then((pickeddate) {
                if (pickeddate != null) {
                  setState(() {
                    selectedDate = pickeddate;
                    _date.text = "${selectedDate.toLocal()}".split(' ')[0];
                  });
                }
                return null;
              });
            }),
      ),
    );
  }
}
