import 'package:flutter/material.dart';
import 'package:food_recpie_app/widgets/notification_tiles.dart';

import '../utils/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: const Text(
              'New',
              style: TextStyle(
                fontFamily: 'InterBold',
                fontSize: 17,
                color: mainText,
              ),
            ),
          ),
          const NotificationTileFollow(),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Text(
              'Today',
              style: TextStyle(
                fontFamily: 'InterBold',
                fontSize: 17,
                color: mainText,
              ),
            ),
          ),
          const NotificationTileLike(),
          const NotificationTileFollowed(),
          const NotificationTileLike(),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Text(
              'Yesterday',
              style: TextStyle(
                fontFamily: 'InterBold',
                fontSize: 17,
                color: mainText,
              ),
            ),
          ),
          const NotificationTileFollow(),
          const NotificationTileFollowed(),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
