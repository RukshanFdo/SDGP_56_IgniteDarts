import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/dashboard.dart';
import 'package:food_recpie_app/screens/sign_in.dart';
import 'package:food_recpie_app/utils/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    GoogleSignInProvider googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
    String returnString = await googleSignInProvider.onStartUp();
    if (returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget root = Container();

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        root = const SignIn();
        break;
      case AuthStatus.loggedIn:
        root = const Dashboard();
        break;
      default:
    }

    return root;
  }
}
