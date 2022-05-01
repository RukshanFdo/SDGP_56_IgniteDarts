import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/my_profile.dart';
import '../widgets/choose_one_option.dart';
import 'scan.dart';
import 'home.dart';
import 'notification.dart';
import 'package:food_recpie_app/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      return;
    } else if (index != 1) {
      setState(() {
        _bottomNavIndex = index;
      });
    } else {
      chooseOneOptionBottomSheet(context);
    }
  }

  Widget? pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const Home();
        }
      case 3:
        {
          return const Notifications();
        }
      case 4:
        {
          return const MyProfile();
        }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: pageCaller(_bottomNavIndex),
      floatingActionButton: Visibility(
        visible: !keyboardIsOpen,
        child: SizedBox(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(
                        cameras: value,
                      ),
                    )));
              },
              tooltip: 'Scan',
              child: const ImageIcon(
                AssetImage('assets/icons/scan.png'),
              ),
              elevation: 4.0,
              backgroundColor: primaryColor,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _bottomNavIndex,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const ImageIcon(
                AssetImage('assets/icons/home.png'),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: const ImageIcon(
                AssetImage('assets/icons/scan.png'),
                size: 10,
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const ImageIcon(
                AssetImage('assets/icons/notification.png'),
              ),
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const ImageIcon(
                AssetImage('assets/icons/profile.png'),
              ),
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: primaryColor,
        unselectedItemColor: secondaryText,
        selectedLabelStyle:
            const TextStyle(fontFamily: 'InterMedium', fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontFamily: 'InterMedium', fontSize: 12),
      ),
    );
  }
}
