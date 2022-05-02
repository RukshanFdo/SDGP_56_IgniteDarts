import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_recpie_app/utils/search_list_provider.dart';
import 'package:food_recpie_app/screens/start_cooking.dart';
import 'package:food_recpie_app/utils/check_state.dart';
import 'package:food_recpie_app/utils/google_sign_in_provider.dart';
import 'package:food_recpie_app/widgets/forgot_password_alert.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

int? initScreen;

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MultiProvider(
        providers: [
          Provider(create: (context) => GoogleSignInProvider()),
          Provider(create: (context) => SearchListProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: ForgotPasswordSnackBar.messengerKey,
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute:
              initScreen == 0 || initScreen == null ? 'welcome' : 'signin',
          routes: {
            'signin': (context) => const Root(),
            'welcome': (context) => const StartCooking()
          },
        ),
      );
    });
  }
}
