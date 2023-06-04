import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/notification_cubit.dart';
import 'package:windchimes/weather/cubit/weather_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'package:windchimes/weather/widgets/widgets.dart';

class AddAlertPage extends StatelessWidget {
  const AddAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddAlertView();
  }
}

class AddAlertView extends StatefulWidget {
  const AddAlertView({super.key});

  @override
  State<AddAlertView> createState() => _AddAlertPageState();
}

class _AddAlertPageState extends State<AddAlertView> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool sunday = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var hour = selectedTime.hour - 12;
    if (hour == 0) {
      hour = 12;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //title: Text("Add Location", style: theme.textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add Scheduled Alert", style: theme.textTheme.headlineLarge),
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text('$hour:${selectedTime.minute}', style: theme.textTheme.displayLarge)
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(selectedTime.period.name.toUpperCase(), style: theme.textTheme.displayLarge)
          ),
          TextButton(
            onPressed: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context, 
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.inputOnly,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          alwaysUse24HourFormat: false,
                        ),
                        child: child!,
                      )
                    )
                  );
                }
              );

              setState(() {
                selectedTime = time ?? TimeOfDay.now();
              });
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(theme.colorScheme.onPrimary), 
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )
              )
            ),
            child: Text("Change Time", style: theme.textTheme.titleMedium),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sunday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: sunday,
                            onChanged: (bool value) {
                              setState(() {
                                sunday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Monday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: monday,
                            onChanged: (bool value) {
                              setState(() {
                                monday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Tuesday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: tuesday,
                            onChanged: (bool value) {
                              setState(() {
                                tuesday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Wednesday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: wednesday,
                            onChanged: (bool value) {
                              setState(() {
                                wednesday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Thursday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: thursday,
                            onChanged: (bool value) {
                              setState(() {
                                thursday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Friday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: friday,
                            onChanged: (bool value) {
                              setState(() {
                                friday = value;
                              });
                            }
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Saturday", 
                              style: theme.textTheme.titleSmall
                            )
                          ),
                          Switch(
                            value: saturday,
                            onChanged: (bool value) {
                              setState(() {
                                saturday = value;
                              });
                            }
                          )
                        ],
                      )
                    )
                  ]
                )
              )
            ),
          )
        ]
      )
    );
  }
}