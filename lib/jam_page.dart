import 'package:flutter/material.dart';

class JamWidget extends StatefulWidget {
  const JamWidget({super.key});

  @override
  State<JamWidget> createState() => _JamWidgetState();
}

class _JamWidgetState extends State<JamWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    timeInput.text = "Pilih Jam";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Widget ke-4')),
        body: Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: timeInput,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch), //icon of text field
                    labelText: "Select Time" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  var timePick = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child!,
                      );
                    },
                  );

                  if (timePick != null) {
                    setState(() {
                      timeInput.text = '${timePick.hour} : ${timePick.minute}';
                    });
                  } else {
                    timeInput.text = "Jam belum dipilih!";
                  }
                },
              )
            ])));
  }
}
