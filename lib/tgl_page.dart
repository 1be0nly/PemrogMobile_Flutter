import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TglWidget extends StatefulWidget {
  const TglWidget({super.key});

  @override
  State<TglWidget> createState() => _TglWidgetState();
}

class _TglWidgetState extends State<TglWidget> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "Pilih Tanggal"; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Widget ke-5')),
        body: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: dateInput, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  final datePick = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: selectedDate,
                    lastDate: selectedDate.add(const Duration(days: 365)),
                  );

                  if (datePick != null) {
                    String formatDate = dateFormat.format(datePick);
                    setState(() {
                      dateInput.text = formatDate;
                    });
                  } else {
                    dateInput.text = "Tanggal belum dipilih!";
                  }
                },
              )
            ])));
  }
}
