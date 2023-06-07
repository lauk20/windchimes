import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/notification_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'package:windchimes/weather/models/notification.dart' as notif;
import 'package:windchimes/weather/view/add_alert_view.dart';
import 'package:windchimes/weather/widgets/widgets.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationView();
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView._();

  const NotificationView({super.key});

  static Route<String> route() {
    return MaterialPageRoute(
      builder: (_) => const NotificationView._()
    );
  }

  @override
  State<NotificationView> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //title: Text("Add Location", style: theme.textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          Text("Alerts", style: theme.textTheme.headlineLarge),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.add
                  ),
                  onPressed: () async {
                    final List items = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddAlertPage()
                      ),
                    );

                    /*
                    List<tz.TZDateTime> times = notif.Notification.getDateTime(
                      sunday: items[1], 
                      monday: items[2], 
                      tuesday: items[3], 
                      wednesday: items[4], 
                      thursday: items[5], 
                      friday: items[6], 
                      saturday: items[7], 
                      selectedTime: items[0]
                    );

                    notif.Notification n = notif.Notification(
                      location: Location.initialLocationState,
                      notificationID: NotificationState.idCounter,
                    );

                    n.addDateAndTimes(times);
                    final nc = BlocProvider.of<NotificationCubit>(context);
                    nc.addNotification(n);
                    */
                  }
                ),
              ],
            ),
          ),
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Card(
                  elevation: 0,
                  color: theme.colorScheme.onPrimary,
                  //color: const Color.fromRGBO(48, 48, 48, 1),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                        child: FadingListView(
                          child: ListView(
                            children: 
                              state.notifications.map((e) {
                                return LocationResultCard(
                                  name: e.dateAndTimes.toString(), 
                                  admin1: e.name, 
                                  countryName: e.name,
                                  location: Location(
                                    latitude: 12,
                                    longitude: 12,
                                    name: "",
                                    countryId: 123,
                                    admin1: "a",
                                    country: "a",
                                  )
                                );
                              }).toList()
                          )
                        )
                      )
                    )
                  )
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}