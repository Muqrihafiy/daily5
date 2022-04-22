import 'package:daily5/helpers/prayer_data_handler.dart';
import 'package:daily5/provider/locationProvider.dart';
import 'package:daily5/provider/locationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/about.dart';
import '../provider/locationProvider.dart';




class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Consumer<LocationProvider>(
        builder: (_, value, __) {
          return FutureBuilder<String>(
            future: PrayDataHandler.init(value.currentLocationCode),
            builder: (_, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .appBarTheme
                          .backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(40)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Builder(builder: (_) {
                      return const PrayTimeList();
                    }),
                  ),
                  // show ads only if no prayer times error happen
                  // annoying bila prayer time tk kluar, tapi ads laju je kluar

                ],
              );
            },
          );
        },
      ),
    );
  }
}