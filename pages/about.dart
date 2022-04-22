import 'package:daily5/helpers/date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


import '../CONSTANTS.dart';
import '../helpers/prayer_data_handler.dart';
import '../models/jakim_esolat_model.dart';
import '../provider/settingsProvider.dart';



String? location;

class PrayTimeList extends StatefulWidget {
  const PrayTimeList({Key? key, this.prayerTime}) : super(key: key);
  final JakimEsolatModel? prayerTime;

  @override
  _PrayTimeListState createState() => _PrayTimeListState();
}

class _PrayTimeListState extends State<PrayTimeList> {
  bool? use12hour = GetStorage().read(kStoredTimeIs12);
  bool? showOtherPrayerTime;

  @override
  Widget build(BuildContext context) {



        var _today = PrayDataHandler.today();

        return Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (showOtherPrayerTime!)
              SolatCard(
                  time: _today.imsak,
                  name: 'imsak',
                  isOther: false),
            SolatCard(
                time: _today.fajr,
                name: 'fajr',
                isOther: true),
            if (showOtherPrayerTime!)
              SolatCard(
                  time: _today.syuruk,
                  name: 'syuruk',
                  isOther: false),
            if (showOtherPrayerTime!)
              SolatCard(
                  time: _today.dhuha,
                  name: 'dhuha',
                  isOther: false),
            SolatCard(
                time: _today.dhuhr,
                name: 'dhuhr',
                isOther: true),
            SolatCard(
                time: _today.asr,
                name: 'asr',
                isOther: true),
            SolatCard(
                time: _today.maghrib,
                name: 'maghrib',
                isOther: true),
            SolatCard(
                time: _today.isha,
                name: 'isha',
                isOther: true),
          ],
        );


  }
}

class SolatCard extends StatelessWidget {
  const SolatCard(
      {Key? key, required this.isOther, required this.name, required this.time})
      : super(key: key);

  /// Imsak, Syuruk, Dhuha set to true
  final bool isOther;
  final String name;
  final DateTime time;


  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (_, value, __) => Container(
        constraints: const BoxConstraints(maxWidth: 320),
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 320),
        height: isOther ? 80 : 55,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          shadowColor: Colors.black54,
          elevation: 4.0,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            splashColor: Colors.teal.withAlpha(30),
            onLongPress: () =>
                Clipboard.setData(ClipboardData(text: '$name: $time'))
                    .then((value) {
                  Fluttertoast.showToast(
                    msg: 'error',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.grey.shade700,
                    textColor: Colors.white,
                  );
                }),

          ),
        ),
      ),
    );
  }
}